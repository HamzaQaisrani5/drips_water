import 'dart:developer';

import 'package:drips_water/src/view/viewcstmr/view_customer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  // // private constructor for singleton
  // LocalNotificationsService._internal();

  // // Singleton instance
  // static final LocalNotificationsService _instance =
  //     LocalNotificationsService._internal();

  // // factory constructor to return Singleton instance
  // factory LocalNotificationsService.instance() {
  //   return _instance;
  // }

  // // main plugin instance
  // late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  // // Android initialization icon launcher
  // final _androidInitializationSetting = AndroidInitializationSettings(
  //   '@mipmap/ic_launcher',
  // );

  // // Anroid notification channel configuration

  // // iOS initialization setting
  // final _iosInitializationSettings = DarwinInitializationSettings(
  //   requestAlertPermission: true,
  //   requestSoundPermission: true,
  //   requestBadgePermission: true,
  // );

  // // Android notificationn channel init
  // final _androidChannel = AndroidNotificationChannel(
  //   'channel_id',
  //   'Android_channel',
  //   description: 'Android push notification',
  //   importance: Importance.max,
  // );

  // // flag to trach is flutter notification initized
  // bool _isFlutterLocalNotificationInitialized = false;

  // // unique ids of every notification
  // int uniqueId = 0;

  // // initializes local notifi for android and iOS
  // Future<void> init() async {
  //   if (_isFlutterLocalNotificationInitialized) return;

  //   // create plugin instance
  //   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //   // combine plateform specific setting
  //   final initializationSetting = InitializationSettings(
  //     android: _androidInitializationSetting,
  //     iOS: _iosInitializationSettings,
  //   );

  //   // initialize plugin with settings and callback on notification Tap
  //   await _flutterLocalNotificationsPlugin.initialize(
  //     settings: initializationSetting,
  //     onDidReceiveNotificationResponse: (NotificationResponse response) {
  //       // Handle notification tap in foreground
  //       log('Foreground Notification Tapped: ${response.payload}');
  //     },
  //   );

  //   // Create android notification channel
  //   await _flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin
  //       >()
  //       ?.createNotificationChannel(_androidChannel);

  //   // Marks initialization complete
  //   _isFlutterLocalNotificationInitialized = true;
  // }

  // // show a local notification with id, body, title and payload
  // Future<void>  showNotification(
  //   String? title,
  //   String? body,
  //   String? payload,
  // ) async {
  //   AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  //     _androidChannel.id,
  //     _androidChannel.name,
  //     channelDescription: _androidChannel.description,
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   // ios notification detail
  //   DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

  //   // combine plateform notification details
  //   final notificationDetails = NotificationDetails(
  //     android: androidDetails,
  //     iOS: iosDetails,
  //   );

  //   // display notification
  //   await _flutterLocalNotificationsPlugin.show(
  //     id: uniqueId++,
  //     title: title,
  //     body: body,
  //     notificationDetails: notificationDetails,
  //     payload: payload,
  //   );
  // }

  // private constructor
  LocalNotificationsService._internal();

  // Singleton constructor
  static final LocalNotificationsService _instance =
      LocalNotificationsService._internal();

  // factory constructor
  factory LocalNotificationsService.instance() => _instance;

  // instances
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // initilization settings
  InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      requestCriticalPermission: true,
    ),
  );

  // checkPoint if notification initialized?
  // bool _isFirebaseNotificationInitialized = false;

  // uniqueId of each notification
  int uniqueId = 0;
  final androidChannel = AndroidNotificationChannel(
    'Android_id',
    'Android_channel',
    importance: Importance.max,
  );

  //  plateformSpecific channel
  Future<void> _plateformSpecificChannel() async {
    // android specfifics
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(
          AndroidNotificationChannel(
            androidChannel.id,
            androidChannel.name,
            importance: Importance.max,
          ),
        );
  }

  // initilization
  Future<void> initialize() async {
    // if (_isFirebaseNotificationInitialized) return;
    log('initilization method triggered');
    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final responseData = response.data;
        log('Notification response data: $responseData');
      },
    );
    await _plateformSpecificChannel();
    // _isFirebaseNotificationInitialized = true;
  }

  Future<void> showNotification({
    String? id,
    required String title,
    required String? body,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id: uniqueId++,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          androidChannel.id,
          androidChannel.name,
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
    log('uniqueId: $uniqueId');
  }
}

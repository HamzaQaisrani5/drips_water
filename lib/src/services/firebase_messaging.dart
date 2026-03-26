import 'dart:developer';
import 'package:drips_water/src/services/local_notifications_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  // FirebaseMessagingService._internal();
  // static final FirebaseMessagingService _instance =
  //     FirebaseMessagingService._internal();
  // factory FirebaseMessagingService.instance() => _instance;

  // // reference to local notifications service
  // late LocalNotificationsService _localNotificationsService;

  // // initialize firebase messaging and sets up all listeners
  // Future<void>  init({
  //   required LocalNotificationsService localNotificationsService,
  // }) async {
  //   _localNotificationsService = localNotificationsService;
  //   await _requestPermissionUser();
  //   await _handlePushNotificationToken();

  //   // handler for background || terminated messages (app terminated)
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  //   // register handler for foreground message
  //   FirebaseMessaging.onMessage.listen(_onForegroundMessage);

  //   // when app is in background && not terminated
  //   FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

  //   // check for initial message that opened the app from terminated state
  //   final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  //   if (initialMessage != null) {
  //     _onMessageOpenedApp(initialMessage);
  //   }
  // }

  // // retrieves and manage FCM token
  // Future<void> _handlePushNotificationToken() async {
  //   // get FCM token
  //   final token = await FirebaseMessaging.instance.getToken();
  //   log('FCM Token: $token');

  //   // listen for token refresh events
  //   FirebaseMessaging.instance.onTokenRefresh
  //       .listen((refreshToken) {
  //         log('Token refreshed: $refreshToken');
  //       })
  //       .onError((error) {
  //         log('Caught error while refreshing Token: $error');
  //       });
  // }

  // // request permission from user
  // Future<void> _requestPermissionUser() async {
  //   var userDecision = await FirebaseMessaging.instance.requestPermission(
  //     alert: true,
  //     sound: true,
  //     badge: true,
  //   );

  //   // log user permission decision
  //   log('User granted permission: ${userDecision.authorizationStatus}');
  // }

  // void _onForegroundMessage(RemoteMessage message) {
  // log('Foreground message received: ${message.data.toString()}');
  // final notificationData = message.notification;
  // if (notificationData != null) {
  //   // Display local notification on foreground app
  //   _localNotificationsService.showNotification(
  //     notificationData.title ?? 'Notification Title',
  //     notificationData.body ?? 'NotificationData Body',
  //     message.data.toString(),
  //   );
  // }
  // }

  // // handles when notification opened from background or terminated
  // void _onMessageOpenedApp(RemoteMessage message) {
  //   log('background message received: ${message.notification}');
  // }

  // private constructor
  FirebaseMessagingService._internal();

  // singleton constructor
  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._internal();

  // factory constructor
  factory FirebaseMessagingService.instance() => _instance;

  // instances
  final LocalNotificationsService _localNotificationsService =
      LocalNotificationsService.instance();

  // permission request and get Token
  Future<void> permissionRequestAndGetToken() async {
    final permission = await FirebaseMessaging.instance.requestPermission();
    final deviceToken = await FirebaseMessaging.instance.getToken();
    log('permissionStatus: ${permission.authorizationStatus}');
    log('deviceToken: $deviceToken');
  }

  // different mode handlers calling
  Future<void> notificationModes() async {
    // checking if initial message is null or not
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Background message received: ${message.notification!.title ?? ''}');
    });
    }
    // foreground handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message)async {
      final messageTitle = message.notification!.title ?? 'N/A';
      final messageBody = message.notification!.body ?? 'N/A';
      log('foreGround message received: ${message.notification!.body}');
     await _localNotificationsService.showNotification(
        // messageId,
        title: messageTitle,
        body:  messageBody,
      );
    });

    // background handling
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Background message received: ${message.notification!.title ?? ''}');
    });

    // handling terminated notification
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

// // handler background messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log(
    'background(terminated) message received ${message.notification!.body.toString()}',
  );
}
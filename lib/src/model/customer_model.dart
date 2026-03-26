class CustomerModel {
  String? name;
  String? address;
  String? phone;
  String? perDayCane;
  String? customerId;
  String? eachCanePrice;

  CustomerModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.perDayCane,
    this.customerId,
    required this.eachCanePrice,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> e, String id) {
    return CustomerModel(
      name: e['name'],
      address: e['address'],
      phone: e['phone'],
      perDayCane: e['perDayCane'],
      eachCanePrice: e['eachCanePrice'],
    );
  }
}

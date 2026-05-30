class AddressModel {
  final int id;
  final int userId;
  String label;
  String address;
  String phoneNum;
  bool isDefault;

  AddressModel({
    required this.id,
    required this.userId,
    required this.label,
    required this.address,
    required this.phoneNum,
    this.isDefault = false,
  });
}

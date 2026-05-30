import 'package:xrpl2_plazaku/models/address_model.dart';

class AddressService {
  List<AddressModel> addresses = [];

  List<AddressModel> userAddress(int userId) {
    return addresses.where((element) => element.userId == userId).toList();
  }

  void addUserAddress(int userId, AddressModel address) {
    final addressIndex = addresses.indexWhere(
      (element) => element.userId == userId,
    );
    if (addressIndex == -1) {
      addresses.add(
        AddressModel(
          id: DateTime.now().millisecondsSinceEpoch,
          userId: userId,
          label: address.label,
          address: address.address,
          phoneNum: address.phoneNum,
        ),
      );
    }
  }

  void deleteUserAddress(int userId, AddressModel address) {
    addresses.removeWhere(
      (element) => element.id == address.id && element.userId == userId,
    );
  }

  void editUserAddress(int userId, AddressModel address) {
    final addressIndex = addresses.indexWhere(
      (element) => element.id == address.id && element.userId == userId,
    );

    if (addressIndex != -1) {
      addresses[addressIndex] = AddressModel(
        id: addresses[addressIndex].id,
        userId: addresses[addressIndex].userId,
        label: address.label,
        address: address.address,
        phoneNum: address.phoneNum,
      );
    } else {
      return;
    }
  }
}

final addressService = AddressService();

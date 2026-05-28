import 'package:flutter/cupertino.dart';
import 'package:xrpl2_plazaku/datas/store_data.dart';
import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';
import 'package:xrpl2_plazaku/models/create_store_model.dart';
import 'package:xrpl2_plazaku/models/store_model.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class StoreService {
  final List<StoreModel> stores = storesData;

  void addStore(int userId, CreateStoreModel data) {
    try {
      final storeIndex = stores.indexWhere(
        (element) =>
            element.userId == userId && element.status == StoreStatus.rejected,
      );

      if (storeIndex != -1) {
        return;
      }

      if (data.category == null ||
          data.deliveryMethod == null ||
          data.paymentMethod == null ||
          data.shopLogo == null) {
        debugPrint('category: ${data.category}');
        debugPrint('deliveryMethod: ${data.deliveryMethod}');
        debugPrint('paymentMethod: ${data.paymentMethod}');
        debugPrint('shopLogo: ${data.shopLogo}');
        debugPrint('store data incomplete');
        return;
      }

      final newStore = StoreModel(
        status: StoreStatus.waiting,
        deliveryMethod: data.deliveryMethod!,
        paymentMethod: data.paymentMethod!,
        address: data.shopAddress,
        emailStore: data.shopEmail,
        phoneNum: data.shopPhoneNum,
        storeDescription: data.shopDescription,
        category: data.category!,
        id: DateTime.now().millisecondsSinceEpoch,
        userId: userId,
        shopName: data.shopName,
        shopLogo: data.shopLogo!.path,
        shopUsername: data.shopUsername ?? '',
      );

      stores.add(newStore);

      appService.updateUserRole(Role.seller, AppMode.seller);
    } catch (e) {
      debugPrint('Error $e');
    }
  }

  void deleteStore(int userId, int storeId) {
    final index = stores.indexWhere(
      (element) => element.id == storeId && element.userId == userId,
    );

    if (index != -1) {
      stores.removeAt(index);
      appService.userModel!.currentMode = AppMode.buyer;
      appService.userModel!.role = Role.buyer;
      appService.userModel!.isSeller = false;
    }
  }
}

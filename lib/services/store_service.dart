import 'package:xrpl2_plazaku/datas/store_data.dart';
import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';
import 'package:xrpl2_plazaku/models/store_model.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class StoreService {
  final List<StoreModel> stores = storesData;

  void addStore(int userId, StoreModel store) {
    final index = stores.indexWhere((element) => element.userId == userId);

    if (index == -1) {
      stores.add(
        StoreModel(
          id: DateTime.now().millisecondsSinceEpoch,
          userId: userId,
          shopName: store.shopName,
          shopLogo: store.shopLogo,
          products: store.products,
          category: store.category,
          paymentMethod: store.paymentMethod,
          address: store.address,
          emailStore: store.emailStore,
          phoneNum: store.phoneNum,
          storeDescription: store.storeDescription,
          deliveryMethod: store.deliveryMethod,
          status: StoreStatus.waiting,
        ),
      );
      appService.userModel!.currentMode = AppMode.seller;
      appService.userModel!.isSeller = true;
      appService.userModel!.role = Role.seller;
    }
  }

  void deleteStore(int userId, StoreModel store) {
    final index = stores.indexWhere(
      (element) => element.id == store.id && element.userId == userId,
    );

    if (index != -1) {
      stores.removeAt(index);
      appService.userModel!.currentMode = AppMode.buyer;
      appService.userModel!.role = Role.buyer;
      appService.userModel!.isSeller = false;
    }
  }
}

import 'package:xrpl2_plazaku/models/delivery_method_model.dart';
import 'package:xrpl2_plazaku/models/payment_method_model.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';
import 'package:xrpl2_plazaku/models/store_model.dart';

List<StoreModel> storesData = [
  StoreModel(
    deliveryMethod: DeliveryMethodModel(
      id: 0,
      title: 'All',
      deliveryMethod: DeliveryMethod.all,
    ),
    paymentMethod: PaymentMethodModel(
      id: 0,
      title: 'COD',
      paymentMethod: PaymentMethod.cod,
    ),
    address: 'Malang',
    emailStore: 'ShopStore@gmail.com',
    phoneNum: '+62 0876-4546-8786',
    storeDescription: 'storeDescription',
    category: Category.electronic,
    id: 0,
    userId: 2,
    shopName: 'shopName',
    shopLogo: 'assets/images/milea.jpg',
    status: StoreStatus.verified,
  ),
  StoreModel(
    status: StoreStatus.rejected,
    deliveryMethod: DeliveryMethodModel(
      id: 1,
      title: 'Expedition Courier',
      deliveryMethod: DeliveryMethod.expeditionCourier,
    ),
    paymentMethod: PaymentMethodModel(
      id: 1,
      title: 'E-Wallet',
      paymentMethod: PaymentMethod.eWallet,
    ),
    address: 'Semarang',
    emailStore: 'emailStore@gmail.com',
    phoneNum: '+62 4566-9876-5463',
    storeDescription: 'storeDescription',
    category: Category.healthCare,
    id: 1,
    userId: 4,
    shopName: 'shopName',
    shopLogo: 'assets/images/basketball.jpg',
  ),
  StoreModel(
    status: StoreStatus.waiting,
    deliveryMethod: DeliveryMethodModel(
      id: 1,
      title: 'Expedition Courier',
      deliveryMethod: DeliveryMethod.expeditionCourier,
    ),
    paymentMethod: PaymentMethodModel(
      id: 1,
      title: 'E-Wallet',
      paymentMethod: PaymentMethod.eWallet,
    ),
    address: 'Medan',
    emailStore: 'emailStore2@gmail.com',
    phoneNum: '+62 4569-9846-5863',
    storeDescription: 'storeDescription2',
    category: Category.food,
    id: 2,
    userId: 1,
    shopName: 'shopName2',
    shopLogo: 'assets/images/food.png',
  ),
];

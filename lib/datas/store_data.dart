import 'package:xrpl2_plazaku/modeOrRole/delivery_method.dart';
import 'package:xrpl2_plazaku/modeOrRole/payment_method.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';
import 'package:xrpl2_plazaku/models/store_model.dart';

List<StoreModel> storesData = [
  StoreModel(
    deliveryMethod: DeliveryMethod.all,
    paymentMethod: PaymentMethod.all,
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
    shopUsername: '',
  ),
  StoreModel(
    status: StoreStatus.rejected,
    deliveryMethod: DeliveryMethod.all,
    paymentMethod: PaymentMethod.all,
    address: 'Semarang',
    emailStore: 'emailStore@gmail.com',
    phoneNum: '+62 4566-9876-5463',
    storeDescription: 'storeDescription',
    category: Category.healthCare,
    id: 1,
    userId: 4,
    shopName: 'shopName',
    shopLogo: 'assets/images/basketball.jpg',
    shopUsername: '',
  ),
  StoreModel(
    status: StoreStatus.waiting,
    deliveryMethod: DeliveryMethod.all,
    paymentMethod: PaymentMethod.all,
    address: 'Medan',
    emailStore: 'emailStore2@gmail.com',
    phoneNum: '+62 4569-9846-5863',
    storeDescription: 'storeDescription2',
    category: Category.food,
    id: 2,
    userId: 3,
    shopName: 'shopName2',
    shopLogo: 'assets/images/food.png',
    shopUsername: '',
  ),
];

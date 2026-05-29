import 'package:xrpl2_plazaku/models/delivery_method_model.dart';
import 'package:xrpl2_plazaku/models/payment_method_model.dart';

import '../models/order_model.dart';
import '../models/product_quantity_model.dart';
import '../services/app_service.dart';

List<OrderModel> orders = [
  OrderModel(
    id: 0,
    userId: 0,
    userName: 'Dika Maulana',
    items: [
      ProductQuantityModel(
        product: productService.products[0],
        quantity: 1,
        variants: productService.products[0].variants,
      ),
      ProductQuantityModel(
        product: productService.products[2],
        quantity: 5,
        variants: productService.products[0].variants,
      ),
    ],
    status: ProductStatus.pending,
    date: DateTime.now().subtract(Duration(hours: 2)),
    location: 'Malang',
    paymentMethod: PaymentMethod.cod,
    sellerId: 0,
    deliveryMethod: DeliveryMethod.expeditionCourier,
  ),
  OrderModel(
    id: 1,
    userId: 1,
    userName: 'Siti Aisyah',
    items: [
      ProductQuantityModel(
        product: productService.products[0],
        quantity: 1,
        variants: productService.products[0].variants,
      ),
      ProductQuantityModel(
        product: productService.products[2],
        quantity: 5,
        variants: productService.products[0].variants,
      ),
    ],
    status: ProductStatus.finish,
    date: DateTime.now().subtract(Duration(days: 1)),
    location: 'Batu',
    paymentMethod: PaymentMethod.transfer,
    sellerId: 0,
    deliveryMethod: DeliveryMethod.expeditionCourier,
  ),
  OrderModel(
    id: 2,
    userId: 2,
    userName: 'Budi Santoso',
    items: [
      ProductQuantityModel(
        product: productService.products[0],
        quantity: 1,
        variants: productService.products[0].variants,
      ),
      ProductQuantityModel(
        product: productService.products[2],
        quantity: 5,
        variants: productService.products[0].variants,
      ),
    ],
    status: ProductStatus.finish,
    date: DateTime.now().subtract(Duration(days: 2)),
    location: 'Jakarta',
    paymentMethod: PaymentMethod.cod,
    sellerId: 0,
    deliveryMethod: DeliveryMethod.expeditionCourier,
  ),
];

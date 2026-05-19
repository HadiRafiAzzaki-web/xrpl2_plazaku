enum DeliveryMethod { all, expeditionCourier, takeItYourself }

class DeliveryMethodModel {
  final int id;
  final String title;
  final DeliveryMethod deliveryMethod;

  DeliveryMethodModel({
    required this.id,
    required this.title,
    required this.deliveryMethod,
  });
}

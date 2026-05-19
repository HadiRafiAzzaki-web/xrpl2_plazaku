enum PaymentMethod { cod, transfer, eWallet }

class PaymentMethodModel {
  final int id;
  final String title;
  final PaymentMethod paymentMethod;

  PaymentMethodModel({
    required this.id,
    required this.title,
    required this.paymentMethod,
  });
}

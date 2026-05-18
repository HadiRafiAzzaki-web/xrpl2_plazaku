enum PaymentType { cod, transfer, eWallet }

class PaymentMethodModel {
  final int id;
  final String title;
  final PaymentType type;

  PaymentMethodModel({
    required this.id,
    required this.title,
    required this.type,
  });
}

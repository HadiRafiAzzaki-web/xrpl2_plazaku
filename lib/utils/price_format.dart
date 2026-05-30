import 'package:intl/intl.dart';

//price format
String formatRupiah(num price) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  ).format(price);
}

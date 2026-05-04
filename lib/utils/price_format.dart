import 'package:intl/intl.dart';

//price format
String formatRupiah(num number) {
  final format = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return format.format(number);
}

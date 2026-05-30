import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';
import 'package:xrpl2_plazaku/widgets/seller_date_picker.dart';

class AdminLaporanPage extends StatefulWidget {
  const AdminLaporanPage({super.key});

  @override
  State<AdminLaporanPage> createState() => _AdminLaporanPageState();
}

class _AdminLaporanPageState extends State<AdminLaporanPage> {
  late DateTimeRange selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SellerDatePicker(onTap: pickDateRange),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Total Pendapatan"), Text("   Rp 1.000.000.000")],
            ),
            Divider(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Total Penjualan"), Text("9.000 Pesanan")],
            ),
            Divider(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Total Seller Aktif'), Text("2.500")],
            ),
            Divider(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Total Produk Terjual"), Text("13.000")],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: CustomButton(
          title: 'Unduh Laporan',
          onPressed: () => Center(),
          color: Colors.purple,
          textColor: Colors.white,
          height: 30,
          width: double.infinity,
          textSize: 18,
        ),
      ),
    );
  }

  Future<void> pickDateRange() async {
    final result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (result != null) {
      setState(() {
        selectedDate = result;
      });
    }
  }
}

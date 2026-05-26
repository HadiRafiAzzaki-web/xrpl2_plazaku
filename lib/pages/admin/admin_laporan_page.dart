import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';

class AdminLaporanPage extends StatefulWidget {
  const AdminLaporanPage({super.key});

  @override
  State<AdminLaporanPage> createState() => _AdminLaporanPageState();
}

class _AdminLaporanPageState extends State<AdminLaporanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text("12 Mei 2026 - 27 Mei 2026"),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
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
          width:double.infinity, textSize: 18,
        ),
      ),
    );
  }
}

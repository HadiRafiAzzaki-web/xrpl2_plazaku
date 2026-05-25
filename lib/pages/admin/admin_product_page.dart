import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/datas/product_data.dart';

import '../../utils/price_format.dart';

class AdminProductPage extends StatefulWidget {
  const AdminProductPage({super.key});

  @override
  State<AdminProductPage> createState() => _AdminProductPageState();
}

class _AdminProductPageState extends State<AdminProductPage> {
  var searchController = TextEditingController();
  String search = '';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = dataProducts
        .where(
          (element) =>
              element.title.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            controller: searchController,
            onChanged: (value) {
              setState(() {
                search = value;
              });
            },
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: 'Search cart',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Product', style: TextStyle(color: Colors.grey)),
                  Text('Seller', style: TextStyle(color: Colors.grey)),
                  Text('Price', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(filteredProducts[index].title),
                        Text('${filteredProducts[index].rating}'),
                        Text(formatRupiah(filteredProducts[index].price)),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

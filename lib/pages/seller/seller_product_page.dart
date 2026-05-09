import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_add_product.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/utils/price_format.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';

class SellerProductPage extends StatefulWidget {
  const SellerProductPage({super.key});

  @override
  State<SellerProductPage> createState() => _SellerProductPageState();
}

class _SellerProductPageState extends State<SellerProductPage> {
  var searchController = TextEditingController();
  String search = '';

  @override
  Widget build(BuildContext context) {
    final user = appService.currentUser!;
    final myProducts = productService
        .sellerProducts(user.id)
        .where((element) => element.title.toLowerCase().contains(search))
        .toList();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        centerTitle: true,
        title: Text('My Product'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
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
        ),
      ),
      body: myProducts.isEmpty
          ? Center(child: Text('My Product empty'))
          : SingleChildScrollView(
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: myProducts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (myProducts[index].image.isNotEmpty)
                          myProducts[index].image.startsWith('assets/')
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    myProducts[index].image,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    File(myProducts[index].image),
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              myProducts[index].title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              formatRupiah(myProducts[index].price),
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Stock: ${myProducts[index].stock}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomButton(
          title: '+ Add Product',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SellerAddProduct()),
            );
          },
          color: Color(0xFF002AFF),
          textColor: Colors.white,
        ),
      ),
    );
  }
}

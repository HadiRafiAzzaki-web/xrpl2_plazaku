import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/buyer/search_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

import '../../widgets/banner_header.dart';
import '../../widgets/categories_widget.dart';
import '../../widgets/product_card.dart';
import '../../widgets/search_bar_widget.dart';
import 'detail_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final products = productService.products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFF999999)],
            ),
          ),
        ),
        //searchbar
        title: SearchBarWidget(
          title: 'Search product',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.inbox, color: Colors.black, size: 40),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.black, size: 40),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //banner
            SizedBox(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                allowImplicitScrolling: true,
                children: [
                  BannerHeader(imageUrl: 'assets/images/banner-shopee.webp'),
                  BannerHeader(
                    imageUrl: 'assets/images/banner-black-friday.webp',
                  ),
                ],
              ),
            ),
            //categories
            Container(color: Colors.white, child: CategoriesWidget()),
            SizedBox(height: 10),
            //products
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  product: products[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailProductPage(id: products[index].id),
                      ),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

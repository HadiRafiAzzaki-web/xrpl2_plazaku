import 'package:flutter/material.dart';
import 'package:plazaku/pages/detail_product_page.dart';
import 'package:plazaku/pages/search_page.dart';
import 'package:plazaku/services/app_service.dart';
import 'package:plazaku/widgets/banner_header.dart';
import 'package:plazaku/widgets/categories_widget.dart';
import 'package:plazaku/widgets/product_card.dart';

import '../widgets/banner_header.dart';
import '../widgets/categories_widget.dart';
import '../widgets/product_card.dart';

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
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Search your product here',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
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
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              color: Colors.white,
              height: 220,
              child: CategoriesWidget(),
            ),
            SizedBox(height: 10),
            //products
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    title: products[index].title,
                    imageUrl: products[index].image,
                    price: products[index].price,
                    rating: products[index].rating,
                    review: products[index].review,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProductPage(
                            product: products[index],
                            wishlistService: wishlistService,
                            cartService: cartService,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

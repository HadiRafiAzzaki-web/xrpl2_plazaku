import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/buyer/search_page.dart';

import '../../models/product_model.dart';
import '../../services/app_service.dart';
import '../../widgets/product_card.dart';
import 'detail_product_page.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  final Category category;

  const CategoryPage({super.key, required this.category, required this.title});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  //save filtered data
  late List<ProductModel> products = [];

  @override
  void initState() {
    //get filtered data
    products = filterService.filterByCategory(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            icon: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
          ),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) => ProductCard(
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
          ),
        ),
      ),
    );
  }
}

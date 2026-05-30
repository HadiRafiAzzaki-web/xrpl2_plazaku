import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/datas/product_data.dart';
import 'package:xrpl2_plazaku/models/variant_model.dart';
import 'package:xrpl2_plazaku/pages/buyer/search_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/utils/product_image.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';

import '../../models/product_model.dart';
import '../../utils/price_format.dart';

class DetailProductPage extends StatefulWidget {
  final int id;

  const DetailProductPage({super.key, required this.id});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  final user = appService.userModel!;

  late ProductModel product;
  Map<String, String> selectedVariants = {};
  List<VariantModel> selected = [];

  //get default product variant and data product
  @override
  void initState() {
    product = dataProducts.firstWhere((element) => element.id == widget.id);
    for (var variant in product.variants) {
      if (variant.options.isNotEmpty) {
        selectedVariants[variant.name] = variant.options.first;
        selected.add(
          VariantModel(name: variant.name, options: variant.options),
        );
      }
    }
    super.initState();
  }

  //add product to cart
  void addToCart() {
    selected.clear();

    selectedVariants.forEach((key, value) {
      selected.add(VariantModel(name: key, options: [value]));
    });
    cartService.addProductToCart(user.id, product, selected);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Product added to cart")));
  }

  //add product to wishlist
  void addWishlist() {
    if (product.isFavorite) {
      wishlistService.removeWishlist(product, user.id);
    } else {
      wishlistService.addWishlist(product, user.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
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
            Card(
              elevation: 3,
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: PageView(children: [ProductImage(image: product.image)]),
              ),
            ),
            SizedBox(height: 5),
            Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(15, 5, 10, 15),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatRupiah(product.price),
                              style: TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  addWishlist();
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: product.isFavorite
                                    ? Colors.red
                                    : Colors.grey,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          product.title,
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 18),
                              Text('${product.rating}'),
                            ],
                          ),
                          SizedBox(width: 10),
                          VerticalDivider(
                            width: 20,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${product.review} Sale',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(width: 10),
                          VerticalDivider(
                            width: 20,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          SizedBox(width: 10),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.location_on, size: 18),
                              Text(
                                product.location,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            product.variants.isNotEmpty
                ? Card(
                    elevation: 3,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: product.variants.map((e) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: e.options.map((er) {
                                  final isSelected =
                                      selectedVariants[e.name] == er;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedVariants[e.name] = er;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: isSelected
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                      child: Text(
                                        er,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 15),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  )
                : Center(child: Text('Variant empty')),
            SizedBox(height: 15),
            Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  product.description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        color: Colors.white,
        child: CustomButton(
          height: 55,
          width: double.infinity,
          title: 'Add to Cart',
          onPressed: () {
            setState(() {
              addToCart();
            });
          },
          color: Colors.black,
          textColor: Colors.white,
          textSize: 18,
        ),
      ),
    );
  }
}

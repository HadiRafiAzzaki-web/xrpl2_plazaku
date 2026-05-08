import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/search_page.dart';

import '../models/product_model.dart';
import '../services/cart_service.dart';
import '../services/wishlist_service.dart';
import '../utils/price_format.dart';

class DetailProductPage extends StatefulWidget {
  final ProductModel product;
  final WishlistService wishlistService;
  final CartService cartService;

  const DetailProductPage({
    super.key,
    required this.product,
    required this.wishlistService,
    required this.cartService,
  });

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  Map<String, String> selectedVariants = {};

  //get product variant
  @override
  void initState() {
    for (var v in widget.product.variants) {
      if (v.options.isNotEmpty) {
        selectedVariants[v.name] = v.options.first;
      }
    }
    super.initState();
  }

  //add product to cart
  void handleAddToCart() {
    //check if all variant has been selected
    if (selectedVariants.length != widget.product.variants.length) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Select all variant first")));
      return;
    }

    widget.cartService.addCart(
      product: widget.product,
      variants: selectedVariants,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Product added to cart")));
  }

  //add product to wishlist
  void handleAddWishlist() {
    widget.wishlistService.addWishlist(widget.product);
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
                child: PageView(
                  children: [
                    Image.asset(
                      widget.product.image,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                height: 200,
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
                              formatRupiah(widget.product.price),
                              style: TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  handleAddWishlist();
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: widget.product.isFavorite
                                    ? Colors.red
                                    : Colors.grey,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.product.title,
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
                              Text('${widget.product.rating}'),
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
                            '${widget.product.review} Sale',
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
                                widget.product.location,
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
            Card(
              elevation: 3,
              child: Container(
                height: 200,
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
                  children: widget.product.variants.map((variant) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          variant.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 10),

                        Wrap(
                          spacing: 8,
                          children: variant.options.map((option) {
                            final isSelected =
                                selectedVariants[variant.name] == option;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedVariants[variant.name] = option;
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
                                  option,
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              handleAddToCart();
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Add to Cart", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

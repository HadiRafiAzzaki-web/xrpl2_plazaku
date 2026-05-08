import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/services/cart_service.dart';
import 'package:xrpl2_plazaku/services/wishlist_service.dart';

import '../../utils/price_format.dart';
import 'detail_product_page.dart';

class WishlistPage extends StatefulWidget {
  final CartService cartService;
  final WishlistService wishlistService;

  const WishlistPage({
    super.key,
    required this.wishlistService,
    required this.cartService,
  });

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  var searchController = TextEditingController();
  String search = '';

  @override
  Widget build(BuildContext context) {
    final wishlistProduct = widget.wishlistService.items
        .where((element) => element.title.toLowerCase().contains(search))
        .toList();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Text('Wishlist'),
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
        //search bar
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
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
                textAlign: TextAlign.start,
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search wishlist',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: wishlistProduct.isEmpty
          ? Center(child: Text('Wishlist empty'))
          : Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: wishlistProduct.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                wishlistProduct[index].image,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  wishlistProduct[index].title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  formatRupiah(wishlistProduct[index].price),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          widget.wishlistService.removeWishlist(
                                            wishlistProduct[index],
                                          );
                                        });
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => DetailProductPage(
                                              product: wishlistProduct[index],
                                              wishlistService:
                                                  widget.wishlistService,
                                              cartService: widget.cartService,
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.shopping_cart),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

import '../../utils/price_format.dart';
import '../../utils/product_image.dart';
import 'detail_product_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  var searchController = TextEditingController();
  String search = '';

  @override
  Widget build(BuildContext context) {
    final user = appService.userModel;
    final wishlistProduct = wishlistService
        .userWishlist(user!.id)
        .where(
          (element) => element.product.title.toLowerCase().contains(search),
        )
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
          : ListView.builder(
              padding: EdgeInsets.all(20),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
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
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                      child: SizedBox(
                        width: 130,
                        height: 150,
                        child: ProductImage(
                          image: wishlistProduct[index].product.image,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wishlistProduct[index].product.title,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Text(
                            formatRupiah(wishlistProduct[index].product.price),
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Text(
                                      '${wishlistProduct[index].product.rating} (${wishlistProduct[index].product.review})',
                                    ),
                                  ],
                                ),
                                Text(wishlistProduct[index].product.location),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    wishlistService.removeWishlist(
                                      wishlistProduct[index].product,
                                      user.id,
                                    );
                                  });
                                },
                                icon: Icon(Icons.favorite, color: Colors.red),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailProductPage(
                                        id: wishlistProduct[index].product.id,
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

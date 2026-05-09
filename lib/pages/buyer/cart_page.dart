import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/services/cart_service.dart';

import '../../utils/price_format.dart';

class CartPage extends StatefulWidget {
  final CartService cartService;

  const CartPage({super.key, required this.cartService});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var searchController = TextEditingController();
  String search = '';
  bool isAll = false;

  @override
  Widget build(BuildContext context) {
    final user = appService.currentUser!;
    final cartProduct = widget.cartService
        .userCart(user.id)
        .where(
          (element) => element.product.title.toLowerCase().contains(search),
        )
        .toList();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Text('Cart'),
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
                  hintText: 'Search cart',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
      //check if cart has product or not
      body: cartProduct.isEmpty
          ? Center(child: Text('Cart empty'))
          : ListView.builder(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              itemCount: cartProduct.length,
              itemBuilder: (context, index) {
                final item = cartProduct[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (cartProduct[index].product.image.isNotEmpty)
                        cartProduct[index].product.image.startsWith('assets/')
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item.product.image,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(item.product.image),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              formatRupiah(item.product.price),
                              style: TextStyle(fontSize: 16),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                                Text(
                                  '${item.product.rating}',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '(${item.product.review})',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    constraints: BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        if (item.quantity > 1) {
                                          item.quantity--;
                                        } else {
                                          widget.cartService.removeCart(index);
                                        }
                                      });
                                    },
                                    icon: Icon(Icons.remove, size: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      '${item.quantity}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  IconButton(
                                    constraints: BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        item.quantity++;
                                      });
                                    },
                                    icon: Icon(Icons.add, size: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Checkbox(
                            value: item.isSelected,
                            onChanged: (value) {
                              setState(() {
                                item.isSelected = value!;

                                isAll = cartProduct.every(
                                  (element) => element.isSelected,
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      //bottom navbar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFF999999)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Checkbox(
                  value: isAll,
                  onChanged: (value) {
                    setState(() {
                      isAll = value!;

                      for (var product in cartProduct) {
                        product.isSelected = isAll;
                      }
                    });
                  },
                ),
                Text('All'),
              ],
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(formatRupiah(widget.cartService.selectedTotalPrice)),
                Card(
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Checkout (${widget.cartService.selectedItemCount})',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

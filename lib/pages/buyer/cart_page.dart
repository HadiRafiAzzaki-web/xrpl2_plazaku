import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/checkout_model.dart';
import 'package:xrpl2_plazaku/models/delivery_method_model.dart';
import 'package:xrpl2_plazaku/models/payment_method_model.dart';
import 'package:xrpl2_plazaku/models/product_quantity_model.dart';
import 'package:xrpl2_plazaku/pages/buyer/checkout_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/utils/product_image.dart';

import '../../utils/price_format.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var searchController = TextEditingController();
  String search = '';
  bool isAll = false;

  @override
  Widget build(BuildContext context) {
    final user = appService.userModel!;
    final cart = cartService;
    final cartProduct = cart
        .userCart(user.id)
        .where(
          (element) => element.product.title.toLowerCase().contains(
            search.toLowerCase(),
          ),
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
      body: cartProduct.isEmpty
          ? Center(child: Text('Cart empty'))
          : ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(20),
              itemCount: cartProduct.length,
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
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                        child: SizedBox(
                          width: 130,
                          height: 150,
                          child: ProductImage(
                            image: cartProduct[index].product.image,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartProduct[index].product.title,
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
                              formatRupiah(cartProduct[index].product.price),
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
                                  '${cartProduct[index].product.rating}',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '(${cartProduct[index].product.review})',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(width: 5),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: cartProduct[index].variants
                                      .map(
                                        (e) => Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Text(
                                            '${e.name}: ${e.options.join(", ")}',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
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
                                        if (cartProduct[index].quantity > 1) {
                                          cartProduct[index].quantity--;
                                        } else {
                                          setState(() {
                                            cart.removeProductFromCart(
                                              cartProduct[index],
                                              user.id,
                                            );
                                          });
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
                                      '${cartProduct[index].quantity}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  IconButton(
                                    constraints: BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        cartProduct[index].quantity++;
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
                            value: cartProduct[index].isSelected,
                            onChanged: (value) {
                              setState(() {
                                cartProduct[index].isSelected = value!;
                                isAll = cart
                                    .userCart(user.id)
                                    .every((element) => element.isSelected);
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                      cart
                          .userCart(user.id)
                          .forEach((element) => element.isSelected = isAll);
                    });
                  },
                ),
                Text('All'),
              ],
            ),
            GestureDetector(
              onTap: () {
                final selectedProduct = cartProduct
                    .where((element) => element.isSelected)
                    .map(
                      (e) => ProductQuantityModel(
                        product: e.product,
                        quantity: e.quantity,
                        variants: e.variants,
                      ),
                    )
                    .toList();
                final checkout = CheckoutModel(
                  id: DateTime.now().millisecondsSinceEpoch,
                  userId: user.id,
                  productsQuantity: selectedProduct,
                  location: user.location,
                  paymentMethod: PaymentMethod.cod,
                  deliveryMethod: DeliveryMethod.takeItYourself,
                );
                if (selectedProduct.isNotEmpty) {
                  checkoutService.addCheckouts(checkout, user.id);
                  final removeSelectedProduct = cartProduct
                      .where((element) => element.isSelected)
                      .toList();
                  for (var element in removeSelectedProduct) {
                    setState(() {
                      cartService.removeProductFromCart(element, user.id);
                    });
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CheckoutPage(checkoutId: checkout.id),
                    ),
                  );
                }
              },
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(formatRupiah(cart.selectedProductCartPrice(user.id))),
                  Card(
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Checkout (${cartService.selectedProductCartCount(user.id)})',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

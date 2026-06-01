import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/datas/order_data.dart';

class AdminOrderPage extends StatefulWidget {
  const AdminOrderPage({super.key});

  @override
  State<AdminOrderPage> createState() => _AdminOrderPageState();
}

class _AdminOrderPageState extends State<AdminOrderPage> {
  var searchController = TextEditingController();
  String search = '';
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    final filteredOrders = orders
        .where(
          (element) => element.userName.toLowerCase().contains(
            search.trim().toLowerCase(),
          ),
        )
        .toList();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Container(
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
              hintText: 'Search order',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Id', style: TextStyle(color: Colors.grey)),
                  Text('Buyer Name', style: TextStyle(color: Colors.grey)),
                  Text('Location', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Divider(),
              ListView.builder(
                itemCount: filteredOrders.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${filteredOrders[index].id}'),
                        Text(filteredOrders[index].userName),
                        Text(filteredOrders[index].location),
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

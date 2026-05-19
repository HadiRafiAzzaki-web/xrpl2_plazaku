import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/widgets/product_card.dart';

class SearchResult extends StatefulWidget {
  final String search;

  const SearchResult({super.key, required this.search});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    final filteredProducts = productService.products
        .where(
          (element) =>
              element.title.toLowerCase().contains(widget.search.toLowerCase()),
        )
        .toList();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFF5F5F5),
        title: TextField(
          onTap: () {
            Navigator.pop(context);
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.black),
            ),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            hint: Text(
              widget.search,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
        ),
      ),
      body: filteredProducts.isEmpty
          ? Center(child: Text('Product empty'))
          : GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              ),
              scrollDirection: Axis.vertical,
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) =>
                  ProductCard(product: filteredProducts[index]),
            ),
    );
  }
}

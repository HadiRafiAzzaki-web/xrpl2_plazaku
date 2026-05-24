import 'package:flutter/material.dart';

import '../pages/buyer/search_page.dart';

class SearchBarWidget extends StatelessWidget {
  final String title;

  const SearchBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

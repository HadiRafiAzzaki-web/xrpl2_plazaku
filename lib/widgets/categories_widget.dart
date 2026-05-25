import 'package:flutter/material.dart';

import '../pages/buyer/category_page.dart';
import '../services/category_service.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          hoverColor: Colors.transparent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(
                  category: categories[index].category,
                  title: categories[index].label,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  categories[index].iconImage,
                  height: 55,
                  width: 55,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 4),
              Text(
                categories[index].label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11, color: Colors.black87),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class CatWidget extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final Widget page;
  final VoidCallback? onTap;

  const CatWidget({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    required this.page,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 22),
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}

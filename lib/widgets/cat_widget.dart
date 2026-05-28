import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class CatWidget extends StatefulWidget {
  final String text;
  final Color color;
  final IconData icon;
  final Widget page;
  final VoidCallback? onTap;
  final bool isSwitchMode;

  const CatWidget({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    required this.page,
    this.onTap,
    this.isSwitchMode = false,
  });

  @override
  State<CatWidget> createState() => _CatWidgetState();
}

class _CatWidgetState extends State<CatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isSwitchMode) {
          setState(() {
            appService.switchBetweenBuyerSeller();
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => widget.page),
            (route) => false,
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.page),
          ).then((value) {
            setState(() {});
          });
        }
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
                child: Icon(widget.icon, color: widget.color, size: 22),
              ),
              Expanded(
                child: Text(
                  widget.text,
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

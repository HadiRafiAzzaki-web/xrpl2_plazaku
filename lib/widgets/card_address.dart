import 'package:flutter/material.dart';

class CardAddress extends StatelessWidget {
  final String addressLabel;
  final String addressName;
  final String phoneNum;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;
  final void Function(bool?)? onChanged;
  final bool onCheckValue;

  const CardAddress({
    super.key,
    required this.onTapEdit,
    required this.onTapDelete,
    required this.onCheckValue,
    required this.addressLabel,
    required this.addressName,
    required this.phoneNum,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.home),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(addressLabel),
                  Text(addressName),
                  Text(phoneNum),
                ],
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Checkbox(value: onCheckValue, onChanged: onChanged),
                  Text(
                    onCheckValue == true ? 'Default address' : 'Set as default',
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onTapEdit,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [Icon(Icons.edit), Text('Edit')],
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: onTapDelete,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        Text('Delete', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

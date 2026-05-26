import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/datas/store_data.dart';
import 'package:xrpl2_plazaku/utils/product_image.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';
import 'package:xrpl2_plazaku/widgets/tab_item_nav.dart';

import '../../models/store_model.dart';

class AdminSellerVerificationPage extends StatefulWidget {
  const AdminSellerVerificationPage({super.key});

  @override
  State<AdminSellerVerificationPage> createState() =>
      _AdminSellerVerificationPageState();
}

class _AdminSellerVerificationPageState
    extends State<AdminSellerVerificationPage> {
  StoreStatus selectedStatus = StoreStatus.waiting;

  final Map<String, StoreStatus> storesStatus = {
    'Waiting': StoreStatus.waiting,
    'Verified': StoreStatus.verified,
    'Rejected': StoreStatus.rejected,
  };

  @override
  Widget build(BuildContext context) {
    var status = storesData;
    if (selectedStatus != StoreStatus.verified ||
        selectedStatus != StoreStatus.rejected) {
      status = storesData
          .where((element) => element.status == selectedStatus)
          .toList();
    }
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: storesStatus.entries
                  .map(
                    (e) => TabItemNav(
                      label: e.key,
                      isActive: selectedStatus == e.value,
                      onTap: () {
                        setState(() {
                          selectedStatus = e.value;
                        });
                      },
                      color: Colors.purple,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: status.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: ProductImage(image: status[index].shopLogo),
                        ),
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(status[index].shopName),
                          Text(status[index].address),
                        ],
                      ),
                    ],
                  ),
                  if (status[index].status == StoreStatus.waiting)
                    Row(
                      children: [
                        CustomButton(
                          title: 'Reject',
                          onPressed: () {},
                          color: Colors.red,
                          textColor: Colors.white,
                          height: 40,
                          width: 80,
                          textSize: 8,
                        ),
                        SizedBox(width: 5),
                        CustomButton(
                          title: 'Accept',
                          onPressed: () {},
                          color: Colors.green,
                          textColor: Colors.white,
                          height: 40,
                          width: 80,
                          textSize: 8,
                        ),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}

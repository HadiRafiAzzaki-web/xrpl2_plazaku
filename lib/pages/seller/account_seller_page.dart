import 'package:flutter/material.dart';
import '../../services/cat_service.dart';
import '../../widgets/cat_widget.dart';

class AccountSellerPage extends StatefulWidget {
  const AccountSellerPage({super.key});

  @override
  State<AccountSellerPage> createState() => _AccountSellerPageState();
}

class _AccountSellerPageState extends State<AccountSellerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Account", style: TextStyle(color: Colors.black))],
        ),
        flexibleSpace: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFF999999)],
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 100 - 60,
              left: 0,
              right: 0,
              child: Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white10,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/milea.jpg'),
                  ),
                ),
              ),
            ),
             Positioned(
              height: 330,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Vanesha",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
              Positioned(
                height: 360,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "vanesha@gmail.com",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            Positioned(
              height:475,top: 200,
              child: Container(
                width: 500,
                padding: EdgeInsets.all(12),
                child: Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                      childAspectRatio: 9,
                    ),
                    itemCount: mod.length,
                    itemBuilder: (context, index) => CatWidget(
                      text: mod[index].text,
                      color: mod[index].color,
                      icon: mod[index].icon,
                      page: mod[index].page,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

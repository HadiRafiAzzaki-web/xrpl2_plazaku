import 'package:flutter/material.dart';

import '../../services/app_service.dart';
import '../../services/cat_service.dart';
import '../../widgets/cat_widget.dart';
import '../splash_screen.dart';

class AccountSellerPage extends StatefulWidget {
  const AccountSellerPage({super.key});

  @override
  State<AccountSellerPage> createState() => _AccountSellerPageState();
}

class _AccountSellerPageState extends State<AccountSellerPage> {
  @override
  Widget build(BuildContext context) {
    final previewCount = mod.length + 1;
    final user = appService.userModel;
    if (user == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Account", style: TextStyle(color: Colors.black))],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white10,
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/images/milea.jpg'),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                user.username,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Center(child: Text(user.email, style: TextStyle(fontSize: 15))),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  childAspectRatio: 8,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: previewCount,
                itemBuilder: (context, index) => index == mod.length
                    ? GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Logout?'),
                              content: Text('Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      appService.logout();
                                    });
                                    if (appService.userModel == null) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SplashScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    }
                                  },
                                  child: Text('Yes'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                    size: 22,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Logout',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                              ],
                            ),
                          ),
                        ),
                      )
                    : CatWidget(
                        text: mod[index].text,
                        color: mod[index].color,
                        icon: mod[index].icon,
                        page: mod[index].page,
                        isSwitchMode: true,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

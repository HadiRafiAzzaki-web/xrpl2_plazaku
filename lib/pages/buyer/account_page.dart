import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/splash_screen.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/services/cat_service.dart';

import '../../widgets/cat_widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final previewCount = mod.length + 1;
    final user = appService.userModel!;
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
                    ? Card(
                        elevation: 1,
                        child: ListTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Log out?'),
                                content: Text(
                                  'Are you sure you want to log out?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      appService.logout();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SplashScreen(),
                                        ),
                                      );
                                    },
                                    child: Text('Yes'),
                                  ),
                                ],
                              ),
                            );
                          },
                          title: Text(
                            'Log out',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Icon(Icons.logout, color: Colors.black),
                        ),
                      )
                    : CatWidget(
                        text: mod[index].text,
                        color: mod[index].color,
                        icon: mod[index].icon,
                        page: mod[index].page,
                        onTap: mod[index].onTap,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

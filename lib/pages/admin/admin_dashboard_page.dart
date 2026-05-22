import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/services/dashboard_admin_service.dart';

import '../splash_screen.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dashboardd[selectedIndex].text,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dashboardd.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    Navigator.pop(context);
                  },
                  leading: Icon(dashboardd[index].icon),
                  title: Text(
                    dashboardd[index].text,
                    style: TextStyle(color: dashboardd[index].color),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Log Out?"),
                        content: Text("Are you sure want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('no'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                appService.logout();
                              });
                              if (appService.userModel == null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SplashScreen(),
                                  ),
                                ).then((value) {
                                  setState(() {});
                                });
                              }
                            },
                            child: Text("yes"),
                          ),
                        ],
                      ),
                    );
                  },
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text("log out", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: dashboardd[selectedIndex].page,
    );
  }
}

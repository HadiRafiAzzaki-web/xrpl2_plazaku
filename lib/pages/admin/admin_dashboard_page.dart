import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/splash_screen.dart';
import 'package:xrpl2_plazaku/services/dashboard_admin_service.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final previewCount = dashboardd.length + 1;
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
        child: ListView.builder(
          itemCount: previewCount,
          itemBuilder: (context, index) => index == dashboardd.length
              ? ListTile(
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SplashScreen(),
                                ),
                              );
                            },
                            child: Text("yes"),
                          ),
                        ],
                      ),
                    );
                  },
                  leading: Icon(Icons.logout),
                  title: Text("log out", style: TextStyle(color: Colors.white)),
                )
              : ListTile(
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
      body: dashboardd[selectedIndex].page,
    );
  }
}

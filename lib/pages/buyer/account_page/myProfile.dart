import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    final user = appService.userModel!;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("My Profile", style: TextStyle(color: Colors.black))],
        ),

        flexibleSpace: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFF999999)],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Center()),
              );
            },
            icon: Icon(CupertinoIcons.pen, color: Colors.black),
          ),
        ],
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
            Positioned.fill(
              top: 140,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 155,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.email,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 200,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Name"),
                subtitle: Text(user.username),
              ),
            ),
            Positioned.fill(
              top: 250,
              child: ListTile(
                leading: Icon(Icons.mail_outline),
                title: Text("email"),
                subtitle: Text(user.email),
              ),
            ),
            Positioned.fill(
              top: 300,
              child: ListTile(
                leading: Icon(Icons.phone_outlined),
                title: Text("Phone Number"),
                subtitle: Text(user.phoneNum),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

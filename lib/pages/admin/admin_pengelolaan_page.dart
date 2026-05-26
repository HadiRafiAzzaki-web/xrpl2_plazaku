import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/datas/data_account.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';

import '../../widgets/tab_item_nav.dart';

class AdminPengelolaanPage extends StatefulWidget {
  const AdminPengelolaanPage({super.key});

  @override
  State<AdminPengelolaanPage> createState() => _AdminPengelolaanPageState();
}

class _AdminPengelolaanPageState extends State<AdminPengelolaanPage> {
  Role selectedrole = Role.all;

  final Map<String, Role> userRoles = {
    'All': Role.all,
    'Pembeli': Role.buyer,
    'Penjual': Role.seller,
    'Admin': Role.admin,
  };

  @override
  Widget build(BuildContext context) {
    var user = users;
    if (selectedrole != Role.all) {
      user = users.where((element) => element.role == selectedrole).toList();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
            color: Color(0xFFF5F5F5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: userRoles.entries
                    .map(
                      (e) => TabItemNav(
                        color: Colors.purple,
                        label: e.key,
                        isActive: selectedrole == e.value,
                        onTap: () {
                          setState(() {
                            selectedrole = e.value;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nama', style: TextStyle(color: Colors.grey)),
                Text('Email', style: TextStyle(color: Colors.grey)),
                Text('Role', style: TextStyle(color: Colors.grey)),
                Text('Status', style: TextStyle(color: Colors.grey)),
                Text('Aksi', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text(user[index].username),
                  title: Text(user[index].email),
                  subtitle: Text('${user[index].role}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

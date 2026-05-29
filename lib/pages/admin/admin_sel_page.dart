import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/user_model.dart';

import '../../datas/data_account.dart';
import '../../modeOrRole/role.dart';

class AdminSelPage extends StatefulWidget {
  const AdminSelPage({super.key});

  @override
  State<AdminSelPage> createState() => _AdminSelPageState();
}

class _AdminSelPageState extends State<AdminSelPage> {
  List<UserModel> use = [];

  @override
  void initState() {
    super.initState();
    List<UserModel> sellers = users
        .where((element) => element.role == Role.seller)
        .toList();
    use.addAll(sellers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: use.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text(use[index].username),
                  title: Text(use[index].email),
                  trailing: Text('${use[index].role}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

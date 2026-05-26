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
  UserModel? user;

  List<UserModel> use = [];

  @override
  void initState() {
    super.initState();
    user = users.firstWhere((element) => element.role == Role.seller);
    use.add(user!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(      body: Container(
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
              itemCount: use.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text(use[index].username),
                title: Text(use[index].email),
                trailing: Text('${use[index].role}'),
              ),
            ),
          ),
        ],
      ),
    ),);
  }
}

import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/address_model.dart';
import 'package:xrpl2_plazaku/models/user_model.dart';
import 'package:xrpl2_plazaku/services/address_service.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';
import 'package:xrpl2_plazaku/widgets/custom_input_field.dart';

import '../../../widgets/card_address.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final _key = GlobalKey<FormState>();
  final label = TextEditingController();
  final address = TextEditingController();
  final phoneNum = TextEditingController();
  final editLabel = TextEditingController();
  final editAddress = TextEditingController();
  final editPhoneNum = TextEditingController();

  bool setDefault = false;

  @override
  Widget build(BuildContext context) {
    final user = appService.userModel;
    if (user == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final addresses = addressService.userAddress(user.id);
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Text(
          'Location',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Text(
            'Manage your saved addresses and delivery locations',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ),
      body: addresses.isEmpty
          ? Center(child: Text('Address is empty'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Addresses',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: addresses.length,
                      itemBuilder: (context, index) => CardAddress(
                        onTapEdit: () {
                          editLabel.text = addresses[index].label;
                          editAddress.text = addresses[index].address;
                          editPhoneNum.text = addresses[index].phoneNum;
                          showEditAddress(addresses[index], user);
                        },
                        onTapDelete: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Delete'),
                              content: Text(
                                'Are you sure tou want to delete this.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      addressService.deleteUserAddress(
                                        user.id,
                                        AddressModel(
                                          id: addresses[index].id,
                                          userId: user.id,
                                          label: addresses[index].label,
                                          address: addresses[index].address,
                                          phoneNum: addresses[index].phoneNum,
                                        ),
                                      );
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text('Yes'),
                                ),
                              ],
                            ),
                          );
                          setState(() {});
                        },
                        onCheckValue: setDefault,
                        addressName: addresses[index].address,
                        addressLabel: addresses[index].label,
                        phoneNum: addresses[index].phoneNum,
                        onChanged: (p0) {
                          setState(() {
                            setDefault = !setDefault;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showAddAddress(user);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void showAddAddress(UserModel user) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: 700,
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Add New Address',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Label',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomInputField(
                        controller: label,
                        keyboardType: TextInputType.text,
                        obscure: false,
                        hint: 'Enter label',
                        suffixIcon: Icon(null),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Label is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomInputField(
                        controller: address,
                        keyboardType: TextInputType.text,
                        obscure: false,
                        hint: 'Enter address',
                        suffixIcon: Icon(null),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Address is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomInputField(
                        controller: phoneNum,
                        keyboardType: TextInputType.number,
                        obscure: false,
                        hint: 'Enter phone number',
                        suffixIcon: Icon(null),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Phone number is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  CustomButton(
                    title: 'Save',
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        addressService.addUserAddress(
                          user.id,
                          AddressModel(
                            id: DateTime.now().millisecondsSinceEpoch,
                            userId: user.id,
                            label: label.text,
                            address: address.text,
                            phoneNum: phoneNum.text,
                          ),
                        );
                        label.clear();
                        address.clear();
                        phoneNum.clear();
                        setState(() {});
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Add success')));
                        Navigator.pop(context);
                      }
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    height: 45,
                    width: double.infinity,
                    textSize: 18,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showEditAddress(AddressModel address, UserModel user) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: 700,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 10,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Edit Address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Label',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  CustomInputField(
                    controller: editLabel,
                    keyboardType: TextInputType.text,
                    obscure: false,
                    hint: 'Enter label',
                    suffixIcon: Icon(null),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  CustomInputField(
                    controller: editAddress,
                    keyboardType: TextInputType.text,
                    obscure: false,
                    hint: 'Enter address',
                    suffixIcon: Icon(null),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Phone Number',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  CustomInputField(
                    controller: editPhoneNum,
                    keyboardType: TextInputType.number,
                    obscure: false,
                    hint: 'Enter phone number',
                    suffixIcon: Icon(null),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              CustomButton(
                title: 'Save',
                onPressed: () {
                  addressService.editUserAddress(
                    user.id,
                    AddressModel(
                      id: address.id,
                      userId: user.id,
                      label: editLabel.text,
                      address: editAddress.text,
                      phoneNum: editPhoneNum.text,
                    ),
                  );
                  editLabel.clear();
                  editAddress.clear();
                  editPhoneNum.clear();
                  setState(() {});
                  Navigator.pop(context);
                },
                color: Colors.black,
                textColor: Colors.white,
                height: 45,
                width: double.infinity,
                textSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

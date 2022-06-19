// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../../constants/colors.dart';
import '../shipping_address_detail_screen/shipping_address_detail.dart';

class EditShippingAddress extends StatefulWidget {
  String name;
  String address;
  String phoneNumber;
  String addressId;
  EditShippingAddress({
    Key? key,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.addressId,
  }) : super(key: key);

  @override
  State<EditShippingAddress> createState() => _EditShippingAddressState();
}

class _EditShippingAddressState extends State<EditShippingAddress> {
  CollectionReference address =
      FirebaseFirestore.instance.collection('address');

  bool processing = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: widget.name);

    final TextEditingController phoneNumberController =
        TextEditingController(text: widget.phoneNumber);

    final TextEditingController addressController =
        TextEditingController(text: widget.address);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: AppColors.grey.withOpacity(0.2),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: height / 18,
        backgroundColor: AppColors.white,
        title: Text("Edit Address",
            style: TextStyle(
                color: AppColors.darkblue,
                fontSize: 17,
                fontFamily: 'Poppins')),
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "You need to enter your name";
                }
                return null;
              },
              onChanged: (value) {},
              controller: nameController,
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
              decoration: InputDecoration(
                hintStyle:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                // prefixIcon: Icon(
                //   Icons.person,
                //   color: AppColors.grey,
                // ),
                hintText: "Enter Delivery person name",
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.red.withOpacity(0.5)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.red.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.blue.withOpacity(0.5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.grey.withOpacity(0.3)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              // enabled: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return "You need to enter your name";
                }
                return null;
              },
              onChanged: (value) {},
              controller: phoneNumberController,
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
              decoration: InputDecoration(
                hintStyle:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                // prefixIcon: Icon(
                //   Icons.person,
                //   color: AppColors.grey,
                // ),
                hintText: "Enter your number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.grey.withOpacity(0.3)),
                ),
                enabled: false,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.red.withOpacity(0.5)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.red.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.blue.withOpacity(0.5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.grey.withOpacity(0.3)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              minLines: 3,
              maxLines: 7,
              validator: (value) {
                if (value!.isEmpty) {
                  return "You need to enter your name";
                }
                return null;
              },
              onChanged: (value) {},
              controller: addressController,
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
              decoration: InputDecoration(
                hintStyle:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                // prefixIcon: Icon(
                //   Icons.person,
                //   color: AppColors.grey,
                // ),
                hintText: "Enter your address",
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.red.withOpacity(0.5)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.red.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.blue.withOpacity(0.5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5, color: AppColors.grey.withOpacity(0.3)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.name != nameController.value.text ||
                  widget.address != addressController.value.text ||
                  widget.phoneNumber != phoneNumberController.value.text) {
                _editAddress(
                    widget.addressId,
                    nameController.value.text,
                    addressController.value.text,
                    phoneNumberController.value.text);
              } else {
                print("same info");
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 6),
                        color: AppColors.blue.withOpacity(0.3),
                        blurRadius: 10)
                  ]),
              child: Center(
                  child: processing
                      ? CircularProgressIndicator(
                          color: AppColors.white,
                        )
                      : Text(
                          "Edit",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: AppColors.white),
                        )),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _editAddress(
      String id, String name, String address, String phoneNumber) async {
    try {
      setState(() {
        processing = true;
      });
      FirebaseFirestore.instance.collection("address").doc(id).update({
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "addressId": id,
      });
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Address Edited Successfully")));
    } catch (e) {
      setState(() {
        processing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Unexpected error occured")));

      print(e);
    }
  }
}

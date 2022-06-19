import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../../constants/colors.dart';

class ShippingAddressDetailScreen extends StatefulWidget {
  const ShippingAddressDetailScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressDetailScreen> createState() =>
      _ShippingAddressDetailScreenState();
}

class _ShippingAddressDetailScreenState
    extends State<ShippingAddressDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  CollectionReference address =
      FirebaseFirestore.instance.collection('address');

  bool processing = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
        title: Text("Add Address",
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
              controller: _nameController,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "You need to enter your name";
                }
                return null;
              },
              onChanged: (value) {},
              controller: _phoneNumberController,
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
              controller: _addressController,
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
            onTap: _addUserAddress,
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
                          "Verify Number",
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

  Future<void> _addUserAddress() async {
    try {
      setState(() {
        processing = true;
      });
      var addressId = Uuid().v4();
      await address.doc(addressId).set({
        'name': _nameController.value.text,
        'address': _addressController.value.text,
        'phoneNumber': _phoneNumberController.value.text,
        'addressId': addressId
      });
      Navigator.of(context).pop();
      setState(() {
        processing = false;
      });
    } catch (e) {
      setState(() {
        processing = false;
      });
      print(e);
    }
  }
}

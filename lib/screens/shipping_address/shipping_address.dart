// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winnie_user/screens/edit_address/edit_address_screen.dart';
import 'package:winnie_user/screens/order_overview/order_overview.dart';

import '../../constants/colors.dart';
import '../shipping_address_detail_screen/shipping_address_detail.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  Stream<QuerySnapshot> _addressStream =
      FirebaseFirestore.instance.collection('address').snapshots();
  var uid = FirebaseAuth.instance.currentUser!.uid;

  Map<String, dynamic> seletedAddress = {
    "name": "",
    "address": "",
    "phoneNumber": ""
  };

  int selectedAddressIndex = 0;
  @override
  Widget build(BuildContext context) {
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ShippingAddressDetailScreen();
                }));
              },
              icon: Icon(
                Icons.add,
                color: AppColors.blue,
              ),
            )
          ],
          title: Text("Ship To",
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
        body: StreamBuilder<QuerySnapshot>(
            stream: _addressStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.blue,
                  ),
                );
              }

              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: SizedBox(
                        // height: 400,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Container(
                              height: height * 0.787,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) =>
                                      _addressModel(
                                          addressId: snapshot.data!.docs[index]
                                              ['addressId'],
                                          index: index,
                                          userName: snapshot.data!.docs[index]
                                              ['name'],
                                          address: snapshot.data!.docs[index]
                                              ['address'],
                                          phoneNumber: snapshot.data!
                                              .docs[index]['phoneNumber'])),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        snapshot.data!.docs.isNotEmpty
                            ? Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                                return OrderOverView(
                                  phoneNumber: selectedAddressIndex == 0
                                      ? snapshot.data!.docs[0]['phoneNumber']
                                      : seletedAddress['phoneNumber'],
                                  name: selectedAddressIndex == 0
                                      ? snapshot.data!.docs[0]['name']
                                      : seletedAddress['name'],
                                  address: selectedAddressIndex == 0
                                      ? snapshot.data!.docs[0]['address']
                                      : seletedAddress['address'],
                                );
                              }))
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Add Shipping address to continue")));
                      },
                      child: Container(
                        height: 50,
                        width: width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
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
                            child: Text(
                          "Next",
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
            }));
  }

  Widget _addressModel(
      {required String userName,
      required String address,
      required String phoneNumber,
      required String addressId,
      required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAddressIndex = index;
          seletedAddress = {
            "name": userName,
            "address": address,
            "phoneNumber": phoneNumber
          };
        });
      },
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.5,
                color: selectedAddressIndex == index
                    ? AppColors.blue.withOpacity(0.4)
                    : AppColors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: double.maxFinite,
                child: Text(
                  userName,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: AppColors.darkblue),
                )),
            SizedBox(
              width: double.infinity,
              child: Text(
                address,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.normal, color: AppColors.grey),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Text(
                phoneNumber,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.normal, color: AppColors.grey),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return EditShippingAddress(
                          name: userName,
                          address: address,
                          phoneNumber: phoneNumber,
                          addressId: addressId);
                    }));
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 10,
                              color: AppColors.blue.withOpacity(0.3))
                        ]),
                    child: Center(
                        child: Text(
                      "Edit",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: AppColors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    _deleteAddress(addressId);
                  },
                  child: Icon(
                    Icons.delete_outline,
                    color: AppColors.grey,
                    size: 28,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _deleteAddress(String id) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delete this address?",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: AppColors.darkblue),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Text(
                                "No",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () async {
                            try {
                              await FirebaseFirestore.instance
                                  .collection('address')
                                  .doc(id)
                                  .delete();

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Address removed")));
                              Navigator.of(context).pop();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Unexpected error occured")));
                              print(e);
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Text(
                                "Yes",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

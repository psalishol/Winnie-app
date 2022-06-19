// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:winnie_user/provider/cart_provider.dart';
import 'package:winnie_user/screens/home_screen/custom_home_screen.dart';
import 'package:winnie_user/screens/home_screen/home_screen.dart';

import '../../constants/colors.dart';
import '../../provider/product.dart';

class OrderOverView extends StatefulWidget {
  String name;
  String address;
  String phoneNumber;
  OrderOverView({
    Key? key,
    required this.name,
    required this.address,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<OrderOverView> createState() => _OrderOverViewState();
}

class _OrderOverViewState extends State<OrderOverView> {
  int _groupValue = 0;
  bool payOnDelivery = true;
  bool isloading = true;

  double _initialHeight = 110;
  bool processing = false;

  void increaseHeight() {
    setState(() {
      _initialHeight = 90;
    });
  }

  void decreaseHeight() {
    setState(() {
      _initialHeight = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String orderId = Uuid().v4();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    List<Product> products = context.read<CartProvider>().products;
    TextTheme theme = Theme.of(context).textTheme;
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
        title: Text("Order Overview",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1.5,
                    color: AppColors.grey.withOpacity(0.3),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.name,
                        style: theme.headline5!.copyWith(
                            color: AppColors.grey, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.address,
                        style: theme.headline5!.copyWith(
                            color: AppColors.grey, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.phoneNumber,
                        style: theme.headline5!.copyWith(
                            color: AppColors.grey, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // height: 200,
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1.5,
                    color: AppColors.grey.withOpacity(0.3),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Item",
                        style: theme.headline5!.copyWith(color: AppColors.grey),
                      ),
                      Text(
                        "Qty",
                        style: theme.headline5!.copyWith(color: AppColors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(
                        context.read<CartProvider>().count,
                        (index) => OrderItemModel(
                              itemName: products[index].productName,
                              itemQuantity:
                                  products[index].itemCount.toString(),
                              theme: theme,
                            )),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                              40,
                              (index) => Text("-",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: AppColors.grey))))),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Cost",
                        style: theme.headline5!.copyWith(
                            color: AppColors.grey, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "N${context.read<CartProvider>().totalProductCost.toString()}",
                        style: theme.headline5!.copyWith(
                            color: AppColors.grey, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  "Payment Method",
                  style: theme.headline4!.copyWith(color: AppColors.darkblue),
                )),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Radio<int>(
                  activeColor: AppColors.blue,
                  value: 0,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    // increaseHeight();
                    setState(() {
                      _groupValue = value!;
                      payOnDelivery = true;
                    });
                  },
                ),
                Text(
                  "Payment on Delivery",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: AppColors.darkblue),
                )
              ],
            ),
            payOnDelivery
                ? AnimatedContainer(
                    height: _initialHeight,
                    width: width * 0.9,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5, color: AppColors.blue.withOpacity(0.3)),
                        // color: AppColors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    duration: const Duration(milliseconds: 600),
                    // color: Colors.red,
                    child: SizedBox(
                      width: width * 0.8,
                      child: Text(
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 13, color: AppColors.grey),
                          "Note that you will be required to provide the exact cash for the items purchased as our agent would not have change to give.\nYou can make transfer via pos which will be provided by our agent on the delivery day"),
                    ))
                : const SizedBox(),
            GestureDetector(
              onTap: () {
                // showBottomSheet(
                //     context: context,
                //     builder: (context) {
                //       return Container();
                //     });
              },
              child: Row(
                children: [
                  Radio<int>(
                    activeColor: AppColors.blue,
                    value: 1,
                    groupValue: _groupValue,
                    onChanged: (value) {
                      // decreaseHeight();
                      setState(() {
                        _groupValue = value!;
                        payOnDelivery = false;
                      });
                    },
                  ),
                  Text(
                    "Pay with Card",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: AppColors.darkblue),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (payOnDelivery) {
                  paymentOnDelivery(
                    context.read<CartProvider>().products,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("Implementation not available yet for this")));
                }
              },
              child: Container(
                height: 50,
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 10),
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
                    child: processing
                        ? CircularProgressIndicator(
                            color: AppColors.white,
                          )
                        : Text(
                            payOnDelivery
                                ? "Confirm Order (N${context.read<CartProvider>().totalProductCost.toString()})"
                                : "Continue to Payment    (N${context.read<CartProvider>().totalProductCost.toString()})",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: AppColors.white),
                          )),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Future<void> paymentOnDelivery(List<Product> orders) async {
    try {
      setState(() {
        processing = true;
      });
      for (var order in orders) {
        CollectionReference orderRef =
            FirebaseFirestore.instance.collection('orders');

        String orderId = const Uuid().v4();
        await orderRef.doc(orderId).set({
          // Customer info
          'customerEmail': FirebaseAuth.instance.currentUser!.email,
          'customerName': widget.name,
          'shippingAddress': widget.address,
          'phoneNumber': widget.phoneNumber,

          // Supplier Info
          "supplierId": order.supplierId,
          'orderId': orderId,

          //Product Info
          "productName": order.productName,
          'productPrice': order.price * order.itemCount,
          'productQty': order.itemCount,
          'productId': order.documentId,
          'productImg': order.imgList,
          'orderDate': DateTime.now(),

          "leftReview": false,
        }).whenComplete(() async {
          FirebaseFirestore.instance.runTransaction((transaction) async {
            DocumentReference documentReference = FirebaseFirestore.instance
                .collection('product')
                .doc(order.documentId);

            DocumentSnapshot productSnapshot =
                await transaction.get(documentReference);
            transaction.update(documentReference, {
              'productQuantity':
                  productSnapshot['productQuantity'] - order.itemCount
            });
          });
        });
      }
      context.read<CartProvider>().clearCart();
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const CustomHomeScreen();
      }));
    } catch (e) {
      setState(() {
        processing = false;
      });

      print(e);
    }
  }
}

class OrderItemModel extends StatelessWidget {
  final String itemName;
  final String itemQuantity;
  const OrderItemModel({
    Key? key,
    required this.itemName,
    required this.itemQuantity,
    required this.theme,
  }) : super(key: key);

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          width: 240,
          child: Text(
            itemName,
            style: theme.headline5!
                .copyWith(color: AppColors.grey, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          itemQuantity,
          style: theme.headline5!
              .copyWith(color: AppColors.grey, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

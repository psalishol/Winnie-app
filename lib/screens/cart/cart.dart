

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.white,
        title:  Text("Cart", style: TextStyle(color: AppColors.darkblue, fontSize: 18, fontFamily: 'Poppins')),
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body:  Center(child: Column(children: [
        Text("No Item Yet!"),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(5) ),
          child: const Center(child: Text("Continue Shopping"))
        )
      ]),)
    );
  }
}
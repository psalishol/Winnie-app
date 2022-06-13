import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:winnie_user/screens/home_screen/custom_home_screen.dart';

import '../../constants/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: AppColors.white,
          title: Text("Cart",
              style: TextStyle(
                  color: AppColors.darkblue,
                  fontSize: 18,
                  fontFamily: 'Poppins')),
          automaticallyImplyLeading: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
        ),
        body: Center(
          child: Container(
            child: Column(children: [
              SizedBox(
                height: size.height * 0.3,
              ),
              Text(
                "No Item Yet!",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: AppColors.grey),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                  height: size.height * 0.053,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const CustomHomeScreen()))),
                      child: Center(
                          child: Text(
                        "Continue Shopping",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppColors.white),
                      ))))
            ]),
          ),
        ));
  }
}

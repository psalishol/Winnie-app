

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constants/constants.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.white,
        leading: Row(
          children: [
            const SizedBox(width: 15,),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.arrow_back_ios, color: AppColors.darkblue, size: 20,)),
          ],
        ),
        leadingWidth: 35,
        title: Text("Payment", style: TextStyle(color: AppColors.darkblue, fontFamily: 'Poppins', fontSize: 18)),
        automaticallyImplyLeading: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
    );
  }
}
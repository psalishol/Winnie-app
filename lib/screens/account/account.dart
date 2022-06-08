// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';
import '../../widgets/account_element.dart';
import 'account_detail/address.dart';
import 'account_detail/order.dart';
import 'account_detail/payment.dart';
import 'account_detail/profile.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.white,
        title: Text("Accounts",
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
      body: SizedBox(
        child: Column(children: [
          accountElement(
              context, "Profle", Icons.person_outlined, const Profile()),
          accountElement(
              context, "Order", Icons.shopping_bag_outlined, const Order()),
          accountElement(
              context, "Address", Icons.location_on_outlined, const Address()),
          accountElement(context, "Payment", Icons.wallet_travel_outlined,
              const Payment()),
        ]),
      ),
    );
  }

  Widget accountElement(
      BuildContext context, String name, IconData icon, Widget route) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.blue,
              size: 26,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: AppColors.darkblue),
            )
          ],
        ),
      ),
    );
  }
}

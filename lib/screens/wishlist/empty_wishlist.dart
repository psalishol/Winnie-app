import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winnie_user/screens/home_screen/custom_home_screen.dart';

import '../../constants/constants.dart';

class EmptyWishListScreen extends StatelessWidget {
  const EmptyWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
        child: Container(
      child: Text(
        "No Item Yet!",
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: AppColors.grey),
      ),
    ));
  }
}

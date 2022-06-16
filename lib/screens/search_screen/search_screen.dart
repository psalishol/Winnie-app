import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      elevation: 0,
      leadingWidth: 25,
      backgroundColor: AppColors.white,
      title: Container(
        // color: Colors.red,
        height: 40,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SizedBox(
                height: 16,
                width: 16,
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.grey,
                    size: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.8,
              child: CupertinoTextField(
                // cursorHeight: 20,
                autofocus: true,
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
                prefixMode: OverlayVisibilityMode.always,
                clearButtonMode: OverlayVisibilityMode.editing,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1.5, color: AppColors.grey.withOpacity(0.1))),
              ),
            ),
          ],
        ),
      ),
      automaticallyImplyLeading: false,
    ));
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/constants/constants.dart';

class DummySearchBarContainer extends StatelessWidget {
  const DummySearchBarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SearchScreen()));
      },
      child: Container(
        height: 33,
        width: MediaQuery.of(context).size.width * 0.93,  
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.5,
            color: AppColors.grey.withOpacity(0.1),
          )
        ),
        child: Row(
          children: [
              const SizedBox(width: 15),
              Icon(Icons.search, color: AppColors.blue, size: 20),
              const SizedBox(width: 25,),
              Text("Search Products", style: Theme.of(context).textTheme.caption!.copyWith(color: AppColors.grey.withOpacity(0.5)))
        ]),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(width: 5,),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.arrow_back_ios, color: AppColors.grey, size: 18,)),
          ],
        ),
        leadingWidth: 25,
        backgroundColor: AppColors.white,
        title:  CupertinoTextField(
          autofocus: true,
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
          prefixMode: OverlayVisibilityMode.always,
          clearButtonMode: OverlayVisibilityMode.editing,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.5,
              color: AppColors.grey.withOpacity(0.1)
            )
          ),
        ),
        automaticallyImplyLeading: true,
      )
    );
  }
}


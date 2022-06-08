

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/constants/constants.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          title: const DummySearchBarContainer(),
          bottom:  TabBar(
            physics: const BouncingScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: AppColors.blue,
            unselectedLabelColor: AppColors.grey,
            indicatorColor: AppColors.blue,
            tabs: const <Tab>[
                Tab(text: "Men"),
                Tab(text: "Women"),
                Tab(text: "Fashion",),
                Tab(text: "Shoes"),
                Tab(text: "Travelling Utilities"),
                Tab(text: "Gadgets"),
                Tab(text: "Home Appliance"),
          ]),
        ),
        body: const TabBarView(children: <Widget>[
          Center(child: Text("1")),
          Center(child: Text("2")),
          Center(child: Text("3")),
          Center(child: Text("4")),
          Center(child: Text("5")),
          Center(child: Text("6")),
          Center(child: Text("7")),
        ]),
      ),
    );
  }
}
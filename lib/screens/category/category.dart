import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/models.dart';
import '/constants/constants.dart';
import '/widgets/widgets.dart';
import 'categories_display/_categories_display.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          title: const DummySearchBarContainer(),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.transparent),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.2,
                child: ListView.builder(
                    itemCount: CategoryModel.category.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.bounceInOut);
                        },
                        child: Container(
                          height: 90,
                          width: 10,
                          margin: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          decoration: BoxDecoration(
                            color: CategoryModel.category[index].isSelected
                                ? AppColors.white
                                : AppColors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              CategoryModel.category[index].categoryName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 14,
                                      color: CategoryModel
                                              .category[index].isSelected
                                          ? AppColors.grey
                                          : AppColors.white),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(color: AppColors.white),
                child: PageView(
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                  onPageChanged: (index) {
                    for (var item in CategoryModel.category) {
                      item.isSelected = false;
                    }
                    setState(() {
                      CategoryModel.category[index].isSelected = true;
                    });
                  },
                  children: const [
                    MenCategoryDisplay(),
                    WomenCategoryDisplay(),
                    ShoesCategoryDisplay(),
                    BagCategoryDisplay(),
                    ElectronicCategoryDisplay(),
                    AccessoriesCategoryDisplay(),
                    HomeAndGardenCategoryDisplay(),
                    KidsCategoryDisplay(),
                    BeautyCategoryDisplay(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

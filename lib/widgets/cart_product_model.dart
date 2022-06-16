import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CartProductModel extends StatelessWidget {
  const CartProductModel({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border:
              Border.all(width: 1.5, color: AppColors.grey.withOpacity(0.1)),
          // color: AppColors.green,
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: AppColors.red, borderRadius: BorderRadius.circular(5)),
          // child: Image(image: AssetImage('')),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          children: [
            SizedBox(
              width: 272,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                    width: 200,
                    child: Text(
                      "Nike Air zoom pegasus 202 for the men and women",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: AppColors.darkblue),
                    ),
                  ),
                  SizedBox(
                    child: Icon(
                      Icons.favorite_outline,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(
                    child: Icon(
                      Icons.delete_outline,
                      color: AppColors.grey,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "N732783.93",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: AppColors.blue),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Row(children: [
                        Container(
                          height: 25,
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(
                                width: 1.5,
                                color: AppColors.grey.withOpacity(0.1)),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                          child: Center(
                              child: Text(
                            "-",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: AppColors.grey),
                          )),
                        ),
                        Container(
                          height: 26,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(0.1),
                          ),
                          child: Center(
                              child: Text(
                            "1",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: AppColors.grey),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 26,
                            width: 30,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    width: 1.5,
                                    color: AppColors.grey.withOpacity(0.1)),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Center(
                                child: Text(
                              "+",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: AppColors.grey),
                            )),
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}

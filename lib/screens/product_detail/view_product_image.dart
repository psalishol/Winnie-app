import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class ViewProductImage extends StatefulWidget {
  final List<dynamic> images;
  const ViewProductImage({Key? key, required this.images}) : super(key: key);

  @override
  State<ViewProductImage> createState() => _ViewProductImageState();
}

class _ViewProductImageState extends State<ViewProductImage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Stack(
            children: [
              ExtendedImage.network(
                widget.images[selectedIndex],
                width: 600,
                height: 400,
                fit: BoxFit.fill,
                cache: true,
              ),
              Positioned(
                left: 10,
                top: 0,
                child: GestureDetector(
                  onTap: (() => Navigator.of(context).pop()),
                  child: Icon(
                    Icons.cancel,
                    color: AppColors.grey.withOpacity(0.5),
                    size: 25,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          // Container(
          //   child: Image(image: NetworkImage(widget.images[selectedIndex])),
          // ),
          Container(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.5,
                              color: AppColors.grey.withOpacity(0.3))),
                      child: Image(image: NetworkImage(widget.images[index])),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

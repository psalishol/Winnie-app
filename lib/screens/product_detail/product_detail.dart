import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winnie_user/screens/cart/cart.dart';
import 'package:winnie_user/screens/wishlist/wishlist.dart';

import '../../constants/colors.dart';
import '../../widgets/product_image_carousel.dart';
import '../../widgets/similar_product.dart';

class ProductDetail extends StatefulWidget {
  final DocumentSnapshot product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int currPage = 0;
  @override
  Widget build(BuildContext context) {
    final double viewportHeight = MediaQuery.of(context).size.height;
    final double viewportWidth = MediaQuery.of(context).size.width;

    Stream<QuerySnapshot> _similarProductSnapShot = FirebaseFirestore.instance
        .collection('product')
        .where('category', isEqualTo: widget.product['category'])
        .where('subcategory', isEqualTo: widget.product['subcategory'])
        // .where('productName', isEqualTo: widget.product['productName'])
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 25.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      size: 18,
                      Icons.arrow_back_ios,
                      color: AppColors.grey,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    widget.product['productName'],
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: AppColors.darkblue),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            // GestureDetector(
            //     onTap: () {
            //       // NavigatorHandler(
            //       //   ctx: context,
            //       //   route: const SearchScreen(),
            //       // );
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => const SearchScreen()));
            //     },
            //     child: SizedBox(
            //       height: 20,
            //       width: 20,
            //       child: Icon(
            //         Icons.search_outlined,
            //         color: AppColors.grey,
            //       ),
            //     )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const WishListScreen();
                  }));
                },
                child: Icon(
                  Icons.favorite_outline_outlined,
                  color: AppColors.grey,
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const CartScreen();
                  }));
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.grey,
                )),
          ],
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: viewportHeight / 18,
        backgroundColor: AppColors.white,

        elevation: 1,
        shadowColor: AppColors.grey.withOpacity(0.3),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ProductImageCarousel(
                    product: widget.product,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: widget.product['productName'].length > 35 ? 55 : 30,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                widget.product['productName'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize: 20,
                                        color: AppColors.darkblue),
                              )),
                        ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 11),
                    child: Text(
                      'N${widget.product['productPrice']}',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: AppColors.blue),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 11),
                      child: Text(
                        "Description",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppColors.darkblue),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.product['productDescription'],
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Products Review",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: AppColors.darkblue)),
                        Text("See more",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: AppColors.blue)),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: viewportWidth,
                    child: Center(
                      child: Text(
                        "No Review Yet",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: AppColors.grey),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 5),
                    width: MediaQuery.of(context).size.width,
                    child: Text("Similar Products",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppColors.darkblue)),
                  ),
                  const SizedBox(height: 20),
                  SimilarProduct(
                      viewportHeight: viewportHeight,
                      similarProductSnapShot: _similarProductSnapShot),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      tooltip: 'Visit Store',
                      onPressed: () {},
                      icon: Icon(Icons.store)),
                  IconButton(
                      tooltip: 'Go to Cart',
                      onPressed: () {},
                      icon:
                          Icon(Icons.shopping_cart, color: AppColors.darkblue)),
                  IconButton(
                      tooltip: 'Add to wishlist',
                      onPressed: () {},
                      icon: Icon(Icons.favorite_outline,
                          color: AppColors.darkblue)),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.blue,
                    ),
                    child: Center(
                        child: Text(
                      "Checkout",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: AppColors.white),
                    )),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:winnie_user/constants/constants.dart';
import 'package:winnie_user/provider/cart_provider.dart';
import 'package:winnie_user/provider/wishlist_provider.dart';
import 'package:winnie_user/screens/cart/empty_cart.dart';
import 'package:winnie_user/widgets/wishlist_product_model.dart';

import '../../widgets/cart_product_model.dart';
import 'empty_wishlist.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: AppColors.grey.withOpacity(0.2),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: height / 18,
        backgroundColor: AppColors.white,
        title: Text("Your Wishlist",
            style: TextStyle(
                color: AppColors.darkblue,
                fontSize: 17,
                fontFamily: 'Poppins')),
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Consumer<WishListProvider>(builder: (context, wishlist, child) {
        return wishlist.count != 0
            ? SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: wishlist.count,
                        itemBuilder: (context, index) {
                          return WishListProductModel(
                            supplierId: wishlist.products[index].supplierId,
                            productId: wishlist.products[index].documentId,
                            productCount:
                                int.parse(wishlist.products[index].itemQty),
                            index: index,
                            width: width,
                            productImages: wishlist.products[index].imgList,
                            productName: wishlist.products[index].productName,
                            productQuantity:
                                wishlist.products[index].itemCount.toString(),
                            productPrice: wishlist.products[index].price,
                          );
                        }),
                  ),
                ]),
              )
            : const EmptyWishListScreen();
      }),
    );
  }
}

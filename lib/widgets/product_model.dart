import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../constants/colors.dart';
import '../screens/product_detail/product_detail.dart';

class ProductModel extends StatelessWidget {
  final Stream<QuerySnapshot> productSnapshot;
  const ProductModel({Key? key, required this.productSnapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: productSnapshot,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            const Center(child: Text("Something went wrong"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.blue,
              ),
            );
          }

          return SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            child: Container(
              color: AppColors.grey.withOpacity(0.1),
              child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  crossAxisCount: 2,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                  product: snapshot.data!.docs[index])));
                        },
                        child: Container(
                          // height: 300,
                          // width: 150,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10)),
                          // margin: const EdgeInsets.all(8),
                          // color: Colors.grey,
                          child: Column(
                            children: [
                              Container(
                                // width: 300,
                                constraints: const BoxConstraints(
                                  minHeight: 100,
                                  maxHeight: 250,
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(snapshot.data!
                                          .docs[index]['productImages'][0])),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 3),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  snapshot.data!.docs[index]['productName'],
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: AppColors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                        'N${snapshot.data!.docs[index]['productPrice']}'),
                                    Icon(
                                      Icons.favorite_outline,
                                      color: AppColors.blue,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (context) =>
                      const StaggeredTile.fit(1)),
            ),
          );
        });
  }
}

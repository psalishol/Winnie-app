import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:winnie_user/widgets/product_model.dart';

class ShoesCategoryTab extends StatelessWidget {
  const ShoesCategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> productSnapshot = FirebaseFirestore.instance
        .collection("product")
        .where('category', isEqualTo: 'shoes')
        .snapshots();
    return ProductModel(productSnapshot: productSnapshot);
  }
}

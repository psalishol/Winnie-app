import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:winnie_user/widgets/product_model.dart';

class HomeApplianceCategoryTab extends StatelessWidget {
  const HomeApplianceCategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> productSnapshot = FirebaseFirestore.instance
        .collection("product")
        .where('category', isEqualTo: 'homeAppliance')
        .snapshots();
    return ProductModel(productSnapshot: productSnapshot);
  }
}

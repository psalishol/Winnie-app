

import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable{

  final String categoryName;
  bool isSelected;

  CategoryModel(
    {
      required this.categoryName,
      this.isSelected = false
    }
  );
  
  @override
  List<Object?> get props => [categoryName, isSelected];

  static List<CategoryModel> category =  <CategoryModel>[
    CategoryModel(categoryName: "Men"),
    CategoryModel(categoryName: "Women"),
    CategoryModel(categoryName: "Shoes"),
    CategoryModel(categoryName: "Bags"),
    CategoryModel(categoryName: "Eletronics"),
    CategoryModel(categoryName: "Accessories"),
    CategoryModel(categoryName: "Home & Garden"),
    CategoryModel(categoryName: "Kids"),
    CategoryModel(categoryName: "Beauty"),
  ];
}
import 'package:flutter/material.dart';
import 'package:shop/model/category.dart';
import 'popular_category_card.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({super.key,required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) => PopularCategoryCard(
          category: categories[index],
        ),
      ),
    );
  }
}

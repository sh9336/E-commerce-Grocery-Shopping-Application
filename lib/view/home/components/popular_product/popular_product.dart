import 'package:flutter/material.dart';
import 'package:shop/model/product.dart';
import 'package:shop/view/home/components/popular_product/popular_product_card.dart';
class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key,required this.popularProducts});
  final List<Product> popularProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: popularProducts.length,
        itemBuilder: (context, index) => PopularProductCard(
            product: popularProducts[index]),
      ),
    );
  }
}

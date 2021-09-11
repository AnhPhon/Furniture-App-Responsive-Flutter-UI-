import 'package:flutter/material.dart';
import 'package:furnitureapp/Screens/Details_screen.dart';

import 'package:furnitureapp/components/Product_Card.dart';
import 'package:furnitureapp/models/Product.dart';
import 'package:furnitureapp/size_config.dart';

class RecommenedProduct extends StatelessWidget {
  const RecommenedProduct({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                SizeConfig.orientation == Orientation.portrait ? 2 : 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.693),
        itemBuilder: (context, index) => ProductCard(
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  product: products[index],
                ),
              ),
            );
          },
          product: products[index],
        ),
      ),
    );
  }
}

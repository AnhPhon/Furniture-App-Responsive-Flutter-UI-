import 'package:flutter/material.dart';
import 'package:furnitureapp/components/Categories.dart';
import 'package:furnitureapp/components/Recommened_Product.dart';

import 'package:furnitureapp/models/Product.dart';
import 'package:furnitureapp/models/categories.dart';
import 'package:furnitureapp/services/fetchCategories.dart';

import 'package:furnitureapp/services/fetchProduct.dart';

import 'package:furnitureapp/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Browse by Categories',
              style: TextStyle(
                fontSize: defaultSize * 1.6,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder(
            future: fetchCategories(),
            builder: (context, snapshot) => snapshot.hasData
                ? Categories(
                    categories: snapshot.data as List<Category>,
                  )
                : Center(
                    child: Image.asset('assets/images/ripple.gif'),
                  ),
          ),
          SizedBox(
            height: defaultSize * 1,
          ),
          Divider(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Recommended for You',
              style: TextStyle(
                fontSize: defaultSize * 1.6,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder(
            future: fetchProducts(),
            builder: (context, snapshot) => snapshot.hasData
                ? RecommenedProduct(
                    products: snapshot.data as List<Product>,
                  )
                : Center(
                    child: Image.asset('assets/images/ripple.gif'),
                  ),
          )
        ],
      ),
    );
  }
}

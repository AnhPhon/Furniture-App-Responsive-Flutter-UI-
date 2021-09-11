import 'package:flutter/material.dart';
import 'package:furnitureapp/Details/Componetns/Product_Info.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/models/Product.dart';
import 'package:furnitureapp/size_config.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight,
            child: Stack(
              children: [
                ProductInfo(
                  product: product,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: defaultSize * 37.5,
                  child: ProductDescription(
                    press: () {},
                    product: product,
                  ),
                ),
                Positioned(
                  top: defaultSize * 11,
                  right: -defaultSize * 1,
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      height: defaultSize * 35,
                      width: defaultSize * 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 34),
      padding: const EdgeInsets.only(
        top: 90,
        left: 20,
        right: 20,
      ),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 3),
          topRight: Radius.circular(defaultSize * 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.subTitle,
            style: TextStyle(
              fontSize: defaultSize * 1.8,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
          SizedBox(
            height: defaultSize * 3,
          ),
          Text(
            product.description,
            style: TextStyle(
              color: kTextColor.withOpacity(0.7),
            ),
          ),
          SizedBox(height: defaultSize * 12),
          GestureDetector(
            onTap: press,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: defaultSize * 1.6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

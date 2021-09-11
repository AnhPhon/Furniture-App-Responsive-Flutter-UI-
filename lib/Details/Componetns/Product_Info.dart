import 'package:flutter/material.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/models/Product.dart';
import 'package:furnitureapp/size_config.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle =
        TextStyle(fontSize: 12, color: kTextColor.withOpacity(0.7));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: defaultSize * 37.5,
      width: defaultSize * 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.product.category.toUpperCase(),
            style: lightTextStyle,
          ),
          SizedBox(
            height: defaultSize / 2,
          ),
          Text(
            widget.product.title,
            style: TextStyle(
                fontSize: defaultSize * 2.5,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.5),
          ),
          SizedBox(
            height: defaultSize * 2,
          ),
          Text(
            'Form',
            style: lightTextStyle,
          ),
          SizedBox(
            height: defaultSize / 2,
          ),
          Text(
            '\$${widget.product.price}',
            style: TextStyle(
                fontSize: defaultSize * 1.6,
                fontWeight: FontWeight.bold,
                height: 1.6),
          ),
          SizedBox(
            height: defaultSize * 2,
          ),
          Text(
            'Available Colors',
            style: lightTextStyle,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: ColorsBox(
                  defaultSize,
                  color: Color(0xFF7BA275),
                  isActive: true,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: ColorsBox(
                  defaultSize,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: ColorsBox(
                  defaultSize,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Stack ColorsBox(double defaultSize,
      {required Color color, bool isActive = false}) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, right: 10),
          padding: const EdgeInsets.all(5),
          height: defaultSize * 2.4,
          width: defaultSize * 2.4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        isActive
            ? Positioned(
                top: 3,
                right: 3,
                left: 0,
                child: Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 30,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

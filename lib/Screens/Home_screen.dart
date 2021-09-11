import 'package:flutter/material.dart';
import 'package:furnitureapp/components/Body.dart';
import 'package:furnitureapp/constants.dart';

import 'package:furnitureapp/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu_open_outlined, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code_scanner_outlined, color: Colors.black),
          ),
          Center(
            child: Text(
              'Scan',
              style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: SizeConfig.defaultSize,
          ),
        ],
      ),
      body: Body(),
    ));
  }
}

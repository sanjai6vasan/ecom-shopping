import 'package:ecom_shopping/constants.dart';
import 'package:flutter/material.dart';

import 'homepage_dress_card.dart';
import 'homepage_related_dress_card.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return TabBarView(
      children: [
        Column(
          children: [
            Container(
              height: (height / 2) * 0.93,
              child: DressCard(),
            ),
            Container(
              width: double.infinity,
              child: Text(
                related_prod,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Alef',
                ),
              ),
            ),
            Expanded(
              child: RelatedDresscard(),
            ),
          ],
        ),
        Icon(Icons.shop, size: 350),
        Icon(Icons.shopping_bag, size: 350),
        Icon(Icons.shop_two_sharp, size: 350),
      ],
    );
  }
}

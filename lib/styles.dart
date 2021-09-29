import 'package:flutter/material.dart';

const animatedContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  ),
);

const product_name = TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600);

const product_price = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w300,
  fontFamily: 'Alef-r',
);

const detail_view_product_name = TextStyle(fontSize: 25.0);

const detail_view_product_value = TextStyle(
    fontSize: 18.0, fontFamily: 'Alex-r', fontWeight: FontWeight.w200);

const country_name = TextStyle(
    fontSize: 18.0, fontFamily: 'Alex-r', fontWeight: FontWeight.w200);

const product_composition = TextStyle(
    fontSize: 18.0, fontFamily: 'Alex-r', fontWeight: FontWeight.w200);

const product_description = TextStyle(
    fontSize: 14.0, fontFamily: 'Alex-r', fontWeight: FontWeight.w200);

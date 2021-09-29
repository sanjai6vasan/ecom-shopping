import 'package:ecom_shopping/assets.dart';
import 'package:ecom_shopping/pages/detail_product_view.dart';
import 'package:flutter/material.dart';

String apptitle = "Ecom Shopping";

String avatar =
    "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg";



List<Widget> availableSizes =
    ["s", "M", "L", "XL"].map<Widget>((size) => sizebutton(size)).toList();

const List tabTitles = ["Coats", "Dresses", "Jersey", "Pants"];


String related_prod = "Recommended for You";

String size = "Your Size";

String addcard = "Add to Card";

String description = "Description";

Color babyPink = Color(0xFFfbd9e0);

String roughttext =
    "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from are also reproduced in their exact original form";

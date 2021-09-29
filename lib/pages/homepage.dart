import 'package:ecom_shopping/constants.dart';
import 'package:flutter/material.dart';
import '../assets.dart';
import 'homepage_body.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: Body(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.00,
      leadingWidth: 50.0,
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        backgroundImage: NetworkImage(
            'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
        maxRadius: 18,
      ),
      actions: [
        IconButton(
          icon: shopping_cart,
          tooltip: 'shopping cart',
          onPressed: () {},
        ),
      ],
      bottom: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50), // Creates border
          color: Color(0xFFfbd9e0),
        ),
        tabs: tabTitles.map((dressKind) => tabbar_menu(dressKind)).toList(),
      ),
    );
  }

  Widget tabbar_menu(String dressKind) {
    return Text(
      dressKind,
      style: TextStyle(
        height: 2,
        fontFamily: 'Alef',
        color: Colors.black,
      ),
    );
  }
}

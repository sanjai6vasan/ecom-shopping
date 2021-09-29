import 'package:flutter/material.dart';
import 'package:ecom_shopping/controllers/detail_view_controller.dart';
import 'package:ecom_shopping/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer/shimmer.dart';

import '../assets.dart';
import '../styles.dart';
import '../models/detailview_productmodel.dart';

class NestedTabBar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _nestedTabController = useTabController(initialLength: 3);
    return StreamBuilder<SingleCelebrity>(
      stream: Detailviewcontroller.to.singleCelebrityController().asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var celebrity = snapshot.data.celebrity;
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: babyPink,
                  ),
                  controller: _nestedTabController,
                  indicatorColor: babyPink,
                  labelColor: Colors.black54,
                  unselectedLabelColor: Colors.black54,
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      text: "Details",
                    ),
                    Tab(
                      text: "Order",
                    ),
                    Tab(
                      text: "Payment",
                    ),
                  ],
                ),
                Container(
                  height: height * 0.60,
                  child: TabBarView(
                    controller: _nestedTabController,
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Primary Talent"),
                                    Text("Country"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      celebrity.primaryTalent,
                                      style: product_composition,
                                    ),
                                    Text(
                                      "India",
                                      style: country_name,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(description),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  celebrity.description,
                                  style: product_description,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          addcardbutton(),
                        ],
                      ),
                      //TAB-2
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.green,
                        ),
                      ),
                      //TAB-3
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: (width / 2) * 0.5,
                      height: (height / 8) * 0.3,
                      color: Colors.grey,
                    ),
                    Container(
                      width: (width / 2) * 0.5,
                      height: (height / 8) * 0.3,
                      color: Colors.grey,
                    ),
                    Container(
                      width: (width / 2) * 0.5,
                      height: (height / 8) * 0.3,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (width / 2) * 0.5,
                      height: (height / 8) * 0.3,
                      color: Colors.grey,
                    ),
                    Container(
                      width: (width / 2) * 0.5,
                      height: (height / 8) * 0.3,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (width / 2) * 0.5,
                      height: (height / 8) * 0.3,
                      color: Colors.grey,
                    ),
                    Container(
                      width: (width / 2) * 0.5,
                      height: (height / 8) * 0.3,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: (width / 2) * 1.8,
                  height: (height / 2) * 0.5,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

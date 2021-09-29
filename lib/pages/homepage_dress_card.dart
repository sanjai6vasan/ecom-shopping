import 'dart:async';
import 'package:ecom_shopping/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../styles.dart';
import 'detail_view.dart';
import '../models/productmodel.dart';

class DressCard extends HookWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return StreamBuilder<CelebrityList>(
      stream: Homecontroller.to.celebrityController().asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  snapshot.data != null ? snapshot.data.celebrities.length : 0,
              itemBuilder: (context, index) {
                var celebrity = snapshot.data.celebrities[index];
                var urlSlug = celebrity.urlSlug;
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: InkWell(
                        onTap: () => {
                          Get.to(Cardview(), arguments: [urlSlug]),
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(celebrity.profilePic),
                              fit: BoxFit.fill,
                            ),
                          ),
                          width: (width / 2) * 1.0,
                          height: (height / 2) * 0.75,
                        ),
                      ),
                    ),
                    Positioned(
                      top: (height / 2) * 0.80,
                      child: Container(
                        width: (width / 2) * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                celebrity.fullName,
                                style: product_name,
                              ),
                            ),
                            // /*
                            Text(
                              "\$${celebrity.charge}",
                              style: product_price,
                            ),
                            // */
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              });
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Container(
                        width: (width / 2) * 1.0,
                        height: (height / 2) * 0.75,
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      top: (height / 2) * 0.80,
                      child: Container(
                        width: (width / 2) * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                color: Colors.grey,
                                height: (height / 6) * 0.50,
                                width: (width / 2) * 0.9,
                              ),
                            ),
                            Container(
                              color: Colors.grey,
                              height: (height / 6) * 0.50,
                              width: (width / 2) * 0.9,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
//

import 'package:flutter/material.dart';
import 'package:ecom_shopping/controllers/detail_view_controller.dart';
import 'package:ecom_shopping/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../assets.dart';
import '../styles.dart';
import '../models/detailview_productmodel.dart';

class Productview extends HookWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: StreamBuilder<SingleCelebrity>(
        stream: Detailviewcontroller.to.singleCelebrityController().asStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var celebrity = snapshot.data.celebrity;
            return Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                celebrity.fullName,
                                style: detail_view_product_name,
                              ),
                              // /*
                              Text(
                                "\$${celebrity.charge}",
                                style: detail_view_product_value,
                              ),
                              // */
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(size),
                              Row(
                                children: availableSizes,
                              )
                            ],
                          ),
                        ),
                      ),
                      ColorRadiobutton(),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  addcardbutton(),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: (width / 2) * 1.5,
                                height: (height / 8) * 0.4,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: (width / 4) * 0.5,
                                height: (height / 8) * 0.3,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: (width / 4) * 0.5,
                                height: (height / 8) * 0.4,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: (width / 3) * 1.5,
                                height: (height / 8) * 0.5,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Container(
                                  width: (width / 2) * 1.8,
                                  height: (height / 8) * 0.5,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

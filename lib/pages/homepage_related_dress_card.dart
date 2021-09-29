import 'package:flutter/material.dart';
import 'package:ecom_shopping/controllers/home_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'detail_view.dart';
import '../models/productmodel.dart';

class RelatedDresscard extends HookWidget {
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
                var celebrity = snapshot.data.celebrities..shuffle();
                var celebrity_shuffle = (celebrity[index]);

                var urlSlug = celebrity_shuffle.urlSlug;
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    InkWell(
                      onTap: () => {
                        Get.to(Cardview(), arguments: [urlSlug]),
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(celebrity_shuffle.profilePic),
                              fit: BoxFit.fill,
                            ),
                          ),
                          width: (width / 2) * 0.8,
                          height: (height / 2) * 0.7,
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
                      width: (width / 2) * 0.8,
                      height: (height / 2) * 0.7,
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:ecom_shopping/controllers/detail_view_controller.dart';
import 'package:ecom_shopping/pages/thumbnail.dart';
import 'package:video_player/video_player.dart';
import 'package:ecom_shopping/pages/nested_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../styles.dart';
import 'detail_product_view.dart';
import '../models/detailview_productmodel.dart';
import 'product_view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

class Detailviewbody extends HookWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Get.put(Detailviewcontroller());
    final selected = useState(true);

    return Scaffold(
      body: StreamBuilder<SingleCelebrity>(
        stream: Detailviewcontroller.to.singleCelebrityController().asStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var celebrity = snapshot.data.celebrity;
            var introVideoUrl = celebrity.introVideoUrl;
            var introVideo =
                "https://d12451cdwf1d65.cloudfront.net/5dcb2e1e-63f8-4b69-97ce-d1aa6f62b410/mp4/31_intro_video_evelynsharma_Mp4_Avc_Aac_16x9_1280x720p_24Hz_4.5Mbps_qvbr.mp4";
            return GestureDetector(
              onTap: () {
                selected.value = false;
              },
              child: Stack(
                children: [
                  Container(
                    height: (height / 2) * 1.1,
                    child: VideoThumb(userId: introVideo),
                    /*
                          PhotoView(
                              imageProvider: NetworkImage(
                                celebrity.profilePic,
                              ),
                              backgroundDecoration:
                                  BoxDecoration(color: Colors.white),
                            )
                            */
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      padding: EdgeInsets.all(10),
                      decoration: animatedContainerDecoration,
                      width: double.infinity,
                      height: selected.value
                          ? (height / 3) * 1.2
                          : (height / 2) * 1.3,
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child:
                          selected.value ? Productview() : DetailProductview(),
                    ),
                  ),
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
              height: (height / 2) * 1.15,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

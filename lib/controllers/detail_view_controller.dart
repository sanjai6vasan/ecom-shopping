import 'package:dio/dio.dart';
import 'package:ecom_shopping/models/detailview_productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detailviewcontroller extends GetxController {
  static Detailviewcontroller get to => Get.find();

  Future<SingleCelebrity> singleCelebrityController() async {
    Dio dio = Dio();

    var urlSlug = Get.arguments;
    final url =
        "https://api.heyheyglobal.com/api/v1/celebrities/show/${urlSlug[0]}";

    final response = await dio.get(url,
        options: Options(headers: {
          'Connection': 'keep-alive',
          'Accept': 'application/json',
          'Api-Version': 'application/vnd.heyhey.v1+json',
          'sec-ch-ua':
              '" Not;A Brand";v="99", "Google Chrome";v="91", "Chromium";v="91"'
        }));

    if (response.statusCode == 200) {
      var data = response.data;
      return SingleCelebrity.fromJson(data);
    } else {
      debugPrint("the api is not working");
      throw Exception();
    }
  }
}

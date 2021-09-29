import 'package:dio/dio.dart';
import 'package:ecom_shopping/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  static Homecontroller get to => Get.find();

  Future<CelebrityList> celebrityController() async {
    Dio dio = Dio();

    final url =
        "https://api.heyheyglobal.com/api/v1/celebrities?ordering=desc&page=1&search=&sort_by=latest";

    final response = await dio.get(url,
        options: Options(headers: {
          'Connection': 'keep-alive',
          'Accept': 'application/json',
          'Api-Version': 'application/vnd.heyhey.v1+json',
          'sec-ch-ua':
              '" Not;A Brand";v="99", "Google Chrome";v="91", "Chromium";v="91"',
        }));

    if (response.statusCode == 200) {
      final data = response.data;
      return CelebrityList.fromJson(data);
    } else {
      throw Exception();
    }
  }
}

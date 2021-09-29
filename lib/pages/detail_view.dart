import 'package:ecom_shopping/pages/detail_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assets.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share/share.dart';
import 'error_page.dart';

class Cardview extends StatefulWidget {
  Cardview({Key key}) : super(key: key);

  @override
  _CardviewState createState() => _CardviewState();
}

class _CardviewState extends State<Cardview> {
  String _shortUrl = '';
  @override
  void initState() {
    super.initState();
    this._initDynamicLinks();
    this.createDynamicLink();
  }

  void _initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      if (deepLink != null) {
        Get.to(deepLink.path);
      }
    }, onError: (OnLinkErrorException e) async {
      Get.to(ErrorPage());
    });

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Get.to(deepLink.path);
    }
  }

  Future<void> createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://ecomshopping.page.link',
      link: Uri.parse('https://ecomshopping.page.link/detailview'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.ecom_shopping',
        minimumVersion: 1,
      ),
    );

    final ShortDynamicLink shortDynamicLink = await parameters.buildShortLink();
    final Uri shortUrl = shortDynamicLink.shortUrl;

    setState(() {
      _shortUrl = shortUrl.toString();
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: Detailviewbody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        icon: arrow_back,
        onPressed: () => Get.back(),
      ),
      actions: [
        IconButton(
          icon: share,
          tooltip: 'share',
          onPressed: () {
            Share.share(_shortUrl);
          },
        ),
        IconButton(
          icon: shopping_cart,
          tooltip: 'shopping cart',
          onPressed: () {},
        ),
      ],
    );
  }
}

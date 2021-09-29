import 'dart:convert';

CelebrityList welcomeFromJson(String str) =>
    CelebrityList.fromJson(json.decode(str));

String welcomeToJson(CelebrityList data) => json.encode(data.toJson());

class CelebrityList {
  CelebrityList({
    this.success,
    this.celebrities,
    this.categories,
    this.banners,
  });

  bool success;
  List<Celebrities> celebrities;
  List<String> categories;
  List<Banner> banners;

  factory CelebrityList.fromJson(Map<String, dynamic> json) => CelebrityList(
        success: json["success"],
        celebrities: List<Celebrities>.from(
            json["celebrities"].map((x) => Celebrities.fromJson(x))),
        categories: List<String>.from(json["categories"].map((x) => x)),
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "celebrities": List<dynamic>.from(celebrities.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    this.bannerType,
    this.imageUrl,
    this.webImageUrl,
    this.celebrity,
  });

  String bannerType;
  String imageUrl;
  String webImageUrl;
  BannerCelebrity celebrity;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        bannerType: json["banner_type"],
        imageUrl: json["image_url"],
        webImageUrl: json["web_image_url"],
        celebrity: json["celebrity"] == null
            ? null
            : BannerCelebrity.fromJson(json["celebrity"]),
      );

  Map<String, dynamic> toJson() => {
        "banner_type": bannerType,
        "image_url": imageUrl,
        "web_image_url": webImageUrl,
        "celebrity": celebrity == null ? null : celebrity.toJson(),
      };
}

class BannerCelebrity {
  BannerCelebrity({
    this.fullName,
    this.avgResponseTime,
    this.urlSlug,
    this.profilePic,
  });

  String fullName;
  int avgResponseTime;
  String urlSlug;
  String profilePic;

  factory BannerCelebrity.fromJson(Map<String, dynamic> json) =>
      BannerCelebrity(
        fullName: json["full_name"],
        avgResponseTime: json["avg_response_time"],
        urlSlug: json["url_slug"],
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "avg_response_time": avgResponseTime,
        "url_slug": urlSlug,
        "profile_pic": profilePic,
      };
}

// */
class Celebrities {
  Celebrities({
    this.fullName,
    this.featured,
    this.urlSlug,
    this.profilePic,
    this.introVideoUrl,
    this.introVideoWebUrl,
    this.introVideoThumbUrl,
    this.charge,
    //this.iosCharge,
    //this.iosTier,
    this.primaryTalent,
  });

  String fullName;
  bool featured;
  String urlSlug;
  String profilePic;
  String introVideoUrl;
  String introVideoWebUrl;
  String introVideoThumbUrl;
  dynamic charge;
  // int iosCharge;
  // IosTier iosTier;
  String primaryTalent;

  factory Celebrities.fromJson(Map<String, dynamic> json) => Celebrities(
        fullName: json["full_name"],
        featured: json["featured"],
        urlSlug: json["url_slug"],
        profilePic: json["profile_pic"],
        introVideoUrl: json["intro_video_url"],
        introVideoWebUrl: json["intro_video_web_url"],
        introVideoThumbUrl: json["intro_video_thumb_url"],
        charge: json["charge"],
        //  iosCharge: json["ios_charge"],
        //   iosTier: IosTier.fromJson(json["ios_tier"]),
        primaryTalent: json["primary_talent"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "featured": featured,
        "url_slug": urlSlug,
        "profile_pic": profilePic,
        "intro_video_url": introVideoUrl,
        "intro_video_web_url": introVideoWebUrl,
        "intro_video_thumb_url": introVideoThumbUrl,
        "charge": charge,
        //  "ios_charge": iosCharge,
        //  "ios_tier": iosTier.toJson(),
        "primary_talent": primaryTalent,
      };
}
/*
class IosTier {
  IosTier({
    this.id,
    this.referenceName,
    this.productId,
    this.price,
  });

  int id;
  String referenceName;
  String productId;
  String price;

  factory IosTier.fromJson(Map<String, dynamic> json) => IosTier(
        id: json["id"],
        referenceName: json["reference_name"],
        productId: json["product_id"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reference_name": referenceName,
        "product_id": productId,
        "price": price,
      };
}
*/

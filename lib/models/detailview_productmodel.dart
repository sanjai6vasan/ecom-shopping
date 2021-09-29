import 'dart:convert';

SingleCelebrity welcomeFromJson(String str) =>
    SingleCelebrity.fromJson(json.decode(str));

String welcomeToJson(SingleCelebrity data) => json.encode(data.toJson());

class SingleCelebrity {
  SingleCelebrity({
    this.success,
    this.celebrity,
  });

  bool success;
  Celebrity celebrity;

  factory SingleCelebrity.fromJson(Map<String, dynamic> json) =>
      SingleCelebrity(
        success: json["success"],
        celebrity: Celebrity.fromJson(json["celebrity"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "celebrity": celebrity.toJson(),
      };
}

class Celebrity {
  Celebrity({
    this.id,
    this.fullName,
    this.primaryTalent,
    this.description,
    this.avgResponseTime,
    this.featured,
    this.urlSlug,
    this.profilePic,
    this.introVideoUrl,
    this.introVideoWebUrl,
    this.introVideoThumbUrl,
    this.charge,
    // this.iosCharge,
    this.categories,
    this.videos,
    this.iosTier,
  });

  int id;
  String fullName;
  String primaryTalent;
  String description;
  int avgResponseTime;
  bool featured;
  String urlSlug;
  String profilePic;
  String introVideoUrl;
  String introVideoWebUrl;
  String introVideoThumbUrl;
  dynamic charge;
  //int iosCharge;
  List<String> categories;
  List<dynamic> videos;
  IosTier iosTier;

  factory Celebrity.fromJson(Map<String, dynamic> json) => Celebrity(
        id: json["id"],
        fullName: json["full_name"],
        primaryTalent: json["primary_talent"],
        description: json["description"],
        avgResponseTime: json["avg_response_time"],
        featured: json["featured"],
        urlSlug: json["url_slug"],
        profilePic: json["profile_pic"],
        introVideoUrl: json["intro_video_url"],
        introVideoWebUrl: json["intro_video_web_url"],
        introVideoThumbUrl: json["intro_video_thumb_url"],
        charge: json["charge"],
        //iosCharge: json["ios_charge"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        videos: List<dynamic>.from(json["videos"].map((x) => x)),
        iosTier: IosTier.fromJson(json["ios_tier"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "primary_talent": primaryTalent,
        "description": description,
        "avg_response_time": avgResponseTime,
        "featured": featured,
        "url_slug": urlSlug,
        "profile_pic": profilePic,
        "intro_video_url": introVideoUrl,
        "intro_video_web_url": introVideoWebUrl,
        "intro_video_thumb_url": introVideoThumbUrl,
        "charge": charge,
        //"ios_charge": iosCharge,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "videos": List<dynamic>.from(videos.map((x) => x)),
        "ios_tier": iosTier.toJson(),
      };
}

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

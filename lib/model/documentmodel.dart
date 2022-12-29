class UserFields {
  static const String imageurl = "imageurl";
  static const String id = "\$id";
  static const String bidderPrice = "bidderPrice";
}

class DocModel {
  String? imageurl;
  String? id;
  int? bidderPrice;

  DocModel({
    required this.imageurl,
    required this.id,
    required this.bidderPrice,
  });

  factory DocModel.fromJson(Map<dynamic, dynamic> json) {
    return DocModel(
        id: json[UserFields.id],
        imageurl: json[UserFields.imageurl],
        bidderPrice: json[UserFields.bidderPrice]);
  }

  Map<dynamic, dynamic> toJson() {
    return {'imageurl': imageurl, 'bidderPrice': bidderPrice};
  }
}

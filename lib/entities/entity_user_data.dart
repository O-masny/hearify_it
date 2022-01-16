import 'dart:convert';

EntityUserData EntityUserDataFromJson(String str) =>
    EntityUserData.fromJson(json.decode(str));

String AuthorizationModelToJson(EntityUserData data) =>
    json.encode(data.toJson());

class EntityUserData {
  String? userName;
  String? country;
  String? product;
  int? id;
  Image? image;

  EntityUserData(
      {this.userName, this.id, this.country, this.product, this.image});

  factory EntityUserData.fromJson(Map<String, dynamic> json) => EntityUserData(
      userName: json["display_name"],
      country: json["country"],
      product: json["product"],
      id: json["id"],
      image: json["images"]);

  Map<String, dynamic> toJson() => {
        "display_name": userName,
        "country": country,
        "product": product,
        "id": id,
        "images": image
      };
}

class Image {
  int? height;
  String? url;
  int? width;
}

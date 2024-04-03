import 'dart:convert';

ResponseListModel responseListModelFromJson(String str) =>
    ResponseListModel.fromJson(json.decode(str));

String responseListModelToJson(ResponseListModel data) =>
    json.encode(data.toJson());

class ResponseListModel {
  bool error;
  String message;
  int count;
  List<RestaurantListModel> restaurants;

  ResponseListModel({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory ResponseListModel.fromJson(Map<String, dynamic> json) =>
      ResponseListModel(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<RestaurantListModel>.from(
            json["restaurants"].map((x) => RestaurantListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class RestaurantListModel {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  RestaurantListModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory RestaurantListModel.fromJson(Map<String, dynamic> json) =>
      RestaurantListModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}

import 'dart:convert';

ResponseSearchModel responseSearchModelFromJson(String str) =>
    ResponseSearchModel.fromJson(json.decode(str));

String responseSearchModelToJson(ResponseSearchModel data) =>
    json.encode(data.toJson());

class ResponseSearchModel {
  bool error;
  int founded;
  List<SearchModel> restaurants;

  ResponseSearchModel({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory ResponseSearchModel.fromJson(Map<String, dynamic> json) =>
      ResponseSearchModel(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<SearchModel>.from(
            json["restaurants"].map((x) => SearchModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class SearchModel {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  SearchModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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

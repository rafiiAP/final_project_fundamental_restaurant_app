import 'dart:convert';

ResponseDetailModel responseDetailModelFromJson(String str) =>
    ResponseDetailModel.fromJson(json.decode(str));

String responseDetailModelToJson(ResponseDetailModel data) =>
    json.encode(data.toJson());

class ResponseDetailModel {
  bool error;
  String message;
  RestaurantDetailModel restaurant;

  ResponseDetailModel({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory ResponseDetailModel.fromJson(Map<String, dynamic> json) =>
      ResponseDetailModel(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantDetailModel.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "restaurant": restaurant.toJson(),
      };
}

class RestaurantDetailModel {
  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  List<Category>? categories;
  Menus? menus;
  double? rating;
  List<CustomerReview>? customerReviews;

  RestaurantDetailModel({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        menus: Menus.fromJson(json["menus"]),
        rating: json["rating"]?.toDouble(),
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        // "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        // "menus": menus!.toJson(),
        "rating": rating,
        // "customerReviews":
        //     List<dynamic>.from(customerReviews!.map((x) => x.toJson())),
      };
}

class Category {
  String name;

  Category({
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class CustomerReview {
  String name;
  String review;
  String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "date": date,
      };
}

class Menus {
  List<Drink> foods;
  List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Drink>.from(json["foods"].map((x) => Drink.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class Drink {
  String name;
  String? restaurantId;

  Drink({
    required this.name,
    this.restaurantId, // Tambahkan restaurantId
  });

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        name: json["name"],
        restaurantId: json["restaurantId"], // Tambahkan restaurantId
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "restaurantId": restaurantId,
      };
}

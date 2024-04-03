import 'dart:convert';

TimeOutModel timeOutModelFromJson(String str) =>
    TimeOutModel.fromJson(json.decode(str));

String timeOutModelToJson(TimeOutModel data) => json.encode(data.toJson());

class TimeOutModel {
  String error;
  String msg;

  TimeOutModel({
    required this.error,
    required this.msg,
  });

  factory TimeOutModel.fromJson(Map<String, dynamic> json) => TimeOutModel(
        error: json["error"],
        msg: json["MSG"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "MSG": msg,
      };
}

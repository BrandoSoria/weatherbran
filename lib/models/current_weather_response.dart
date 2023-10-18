import 'dart:convert';
import 'package:weatherbran/models/datum.dart';

class CurrentWeatherResponse {
    int count;
    List<Datum> data;

    CurrentWeatherResponse({
        required this.count,
        required this.data,
    });

    factory CurrentWeatherResponse.fromRawJson(String str) => CurrentWeatherResponse.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) => CurrentWeatherResponse(
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}



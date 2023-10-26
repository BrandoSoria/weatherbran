import 'dart:convert';
import 'package:weatherbran/models/datum.dart';
class NowCurrentWeatherResponse {
    int count;
    List<Datum> data;

    NowCurrentWeatherResponse({
        required this.count,
        required this.data,
    });

    factory NowCurrentWeatherResponse.fromRawJson(String str) => NowCurrentWeatherResponse.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

  factory NowCurrentWeatherResponse.fromJson(Map<String, dynamic> json) => NowCurrentWeatherResponse(
  count: json["count"] ?? 0, // Usar 0 (u otro valor predeterminado) si "count" es nulo
  data: (json["data"] as List<dynamic>?)
      ?.map((x) => Datum.fromJson(x))
      .toList() ?? [], // Usar una lista vacía si "data" es nulo
);
    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}



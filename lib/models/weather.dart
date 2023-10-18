import 'dart:convert';

class Weather {
    String description;
    int code;
    String icon;

    Weather({
        required this.description,
        required this.code,
        required this.icon,
    });

    factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json["description"],
        code: json["code"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "code": code,
        "icon": icon,
    };
}
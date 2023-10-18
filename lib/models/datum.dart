import 'dart:convert';
import 'package:weatherbran/models/weather.dart';

class Datum {
    double appTemp;
    int aqi;
    String cityName;
    int clouds;
    String countryCode;
    String datetime;
    double dewpt;
    int dhi;
    int dni;
    double elevAngle;
    int ghi;
    dynamic gust;
    int hAngle;
    double lat;
    double lon;
    String obTime;
    String pod;
    int precip;
    double pres;
    int rh;
    double slp;
    int snow;
    int solarRad;
    List<String> sources;
    String stateCode;
    String station;
    String sunrise;
    String sunset;
    double temp;
    String timezone;
    int ts;
    int uv;
    int vis;
    Weather weather;
    String windCdir;
    String windCdirFull;
    int windDir;
    int windSpd;

    Datum({
        required this.appTemp,
        required this.aqi,
        required this.cityName,
        required this.clouds,
        required this.countryCode,
        required this.datetime,
        required this.dewpt,
        required this.dhi,
        required this.dni,
        required this.elevAngle,
        required this.ghi,
        required this.gust,
        required this.hAngle,
        required this.lat,
        required this.lon,
        required this.obTime,
        required this.pod,
        required this.precip,
        required this.pres,
        required this.rh,
        required this.slp,
        required this.snow,
        required this.solarRad,
        required this.sources,
        required this.stateCode,
        required this.station,
        required this.sunrise,
        required this.sunset,
        required this.temp,
        required this.timezone,
        required this.ts,
        required this.uv,
        required this.vis,
        required this.weather,
        required this.windCdir,
        required this.windCdirFull,
        required this.windDir,
        required this.windSpd,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        appTemp: json["app_temp"]?.toDouble(),
        aqi: json["aqi"],
        cityName: json["city_name"],
        clouds: json["clouds"],
        countryCode: json["country_code"],
        datetime: json["datetime"],
        dewpt: json["dewpt"]?.toDouble(),
        dhi: json["dhi"],
        dni: json["dni"],
        elevAngle: json["elev_angle"]?.toDouble(),
        ghi: json["ghi"],
        gust: json["gust"],
        hAngle: json["h_angle"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        obTime: json["ob_time"],
        pod: json["pod"],
        precip: json["precip"],
        pres: json["pres"]?.toDouble(),
        rh: json["rh"],
        slp: json["slp"]?.toDouble(),
        snow: json["snow"],
        solarRad: json["solar_rad"],
        sources: List<String>.from(json["sources"].map((x) => x)),
        stateCode: json["state_code"],
        station: json["station"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"]?.toDouble(),
        timezone: json["timezone"],
        ts: json["ts"],
        uv: json["uv"],
        vis: json["vis"],
        weather: Weather.fromJson(json["weather"]),
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
        windDir: json["wind_dir"],
        windSpd: json["wind_spd"],
    );

    Map<String, dynamic> toJson() => {
        "app_temp": appTemp,
        "aqi": aqi,
        "city_name": cityName,
        "clouds": clouds,
        "country_code": countryCode,
        "datetime": datetime,
        "dewpt": dewpt,
        "dhi": dhi,
        "dni": dni,
        "elev_angle": elevAngle,
        "ghi": ghi,
        "gust": gust,
        "h_angle": hAngle,
        "lat": lat,
        "lon": lon,
        "ob_time": obTime,
        "pod": pod,
        "precip": precip,
        "pres": pres,
        "rh": rh,
        "slp": slp,
        "snow": snow,
        "solar_rad": solarRad,
        "sources": List<dynamic>.from(sources.map((x) => x)),
        "state_code": stateCode,
        "station": station,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "timezone": timezone,
        "ts": ts,
        "uv": uv,
        "vis": vis,
        "weather": weather.toJson(),
        "wind_cdir": windCdir,
        "wind_cdir_full": windCdirFull,
        "wind_dir": windDir,
        "wind_spd": windSpd,
    };
}
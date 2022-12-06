
import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.population,
    required this.isCapital,
  });

  final String name;
  final double latitude;
  final double longitude;
  final String country;
  final int population;
  final bool isCapital;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    name: json["name"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    country: json["country"],
    population: json["population"],
    isCapital: json["is_capital"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "country": country,
    "population": population,
    "is_capital": isCapital,
  };
}

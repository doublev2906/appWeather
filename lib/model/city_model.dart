import 'dart:convert';

import 'package:hive/hive.dart';

part 'city_model.g.dart';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class CityModel extends HiveObject {
  CityModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    this.country,
    this.population,
    this.isCapital,
    this.timeAdd = 0
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final double latitude;
  @HiveField(2)
  final double longitude;
  @HiveField(3)
  final String? country;
  @HiveField(4)
  final int? population;
  @HiveField(5)
  final bool? isCapital;
  @HiveField(6)
  int timeAdd;

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

// To parse this JSON data, do
//
//     final homeWorldModel = homeWorldModelFromJson(jsonString);

import 'dart:convert';

class HomeWorldModel {
  HomeWorldModel({
    this.name,
    this.rotationPeriod,
    this.orbitalPeriod,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surfaceWater,
    this.population,
  });

  final String? name;
  final String? rotationPeriod;
  final String? orbitalPeriod;
  final String? diameter;
  final String? climate;
  final String? gravity;
  final String? terrain;
  final String? surfaceWater;
  final String? population;

  factory HomeWorldModel.fromRawJson(String str) =>
      HomeWorldModel.fromJson(json.decode(str));

  factory HomeWorldModel.fromJson(Map<String, dynamic> json) => HomeWorldModel(
        name: json["name"],
        rotationPeriod: json["rotation_period"],
        orbitalPeriod: json["orbital_period"],
        diameter: json["diameter"],
        climate: json["climate"],
        gravity: json["gravity"],
        terrain: json["terrain"],
        surfaceWater: json["surface_water"],
        population: json["population"],
      );
}

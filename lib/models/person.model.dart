class PersonModel {
  PersonModel({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.gender,
    this.homeworld,
    this.vehicles,
    this.starships,
  });
  int? userId;
  final String? name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;
  final String? eyeColor;
  final String? gender;
  final String? homeworld;
  final List<String>? vehicles;
  final List<String>? starships;

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        gender: json["gender"],
        homeworld: json["homeworld"],
        vehicles: json["vehicles"] == null
            ? null
            : List<String>.from(json["vehicles"].map((x) => x)),
        starships: json["starships"] == null
            ? null
            : List<String>.from(json["starships"].map((x) => x)),
      );
  bool get hasStarShip {
    return starships!.isNotEmpty;
  }

  bool get hasVehicles {
    return vehicles!.isNotEmpty;
  }

  bool get hasHomeWord {
    return homeworld != null;
  }
}

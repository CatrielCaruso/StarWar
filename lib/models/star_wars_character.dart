import 'package:star_wars/models/models.dart';

class StarWarsCharacter {
  PersonModel? character;
  List<VehicleModel>? vehicles;
  List<StarShipModel>? starShips;

  StarWarsCharacter({
    this.character,
    this.starShips,
    this.vehicles,
  });
}

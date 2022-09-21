import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:star_wars/core/dio.core.dart';
import 'package:star_wars/models/models.dart';

/// El objeto[_people] contiene en forma páginada los personajes de StarWars(Viene páginado).
/// La variable [_persons] y [_auxPersons] son listas que contendrán y almacenaran por cada
/// petición a la api los persajes de StarsWars.
/// Las variables [_starShips] y [_vehicles] contiene los vehículos y naves DE UN SOLO PERSONAJE.
/// La variable entera [_page] indica la página que se le pide a la api que devulva cuándo se
/// buscan los personajes.

class StarWarsProvider with ChangeNotifier, DioClient {
  PeopleModel? _people;
  List<PersonModel> _persons = [];
  List<PersonModel> _auxPersons = [];
  List<StarShipModel> _starShips = [];
  List<VehicleModel> _vehicles = [];
  StarWarsCharacter? _starWarsCharacter;

  int _page = 1;

  /// Función para traer los pesonajes de starWars
  Future<void> getPeople() async {
    try {
      final Response<String> response = await dio.get(
        'https://swapi.dev/api/people/?page=${_page.toString()}',
      );
      final Map<String, dynamic> responseData = jsonDecode(
        response.toString(),
      );

      /// Guardo el objeto que trae la api.
      _people = PeopleModel.fromJson(responseData);

      /// Guardo en la lista aux [_auxPersons] los valores actuales de la lista [_person].
      _auxPersons = _persons;

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  /// Función para traer las naves de UN PERSONAJE DE STARWARS
  Future<void> getStarShip({required String pathStarShip}) async {
    try {
      final Response<String> response = await dio.get(
        pathStarShip,
      );

      _starShips.add(
        StarShipModel.fromRawJson(
          response.toString(),
        ),
      );

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  /// Función para traer los vehículos DE UN PERSONAJE DE STARWARS
  Future<void> getVehicle({required String pathVehicle}) async {
    try {
      final Response<String> response = await dio.get(
        pathVehicle,
      );

      _vehicles.add(
        VehicleModel.fromRawJson(
          response.toString(),
        ),
      );

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  /// Esta función se utiliza para incremetar la
  /// página a la hora de hacer peticiones para traer a
  /// las personas. (Porque esta páginado)
  pageIncrement() {
    _page++;

    notifyListeners();
  }

  List<PersonModel> get persons {
    _persons = [..._auxPersons, ...people!.persons];
    return _persons;
  }

  PeopleModel? get people {
    return _people;
  }

  void characterSelected({required PersonModel person}) {
    starWarsCharacter = StarWarsCharacter(
        character: person, starShips: _starShips, vehicles: _vehicles);
    notifyListeners();
  }

  StarWarsCharacter? get starWarsCharacter {
    return _starWarsCharacter;
  }

  set starWarsCharacter(StarWarsCharacter? value) {
    _starWarsCharacter = value;
    notifyListeners();
  }
}

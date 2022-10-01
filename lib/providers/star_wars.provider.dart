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
  // ignore: prefer_final_fields
  List<StarShipModel> _starShips = [];
  // ignore: prefer_final_fields
  List<VehicleModel> _vehicles = [];
  StarWarsCharacter? _starWarsCharacter;
  HomeWorldModel? _homeWorldModel;
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
        pathStarShip + 'hhh',
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

  /// Función para traer los vehículos DE UN PERSONAJE DE STARWARS
  Future<void> getHomeWorld({required String pathHomeWorld}) async {
    try {
      final Response<String> response = await dio.get(
        pathHomeWorld,
      );
      homeWorldModel = HomeWorldModel.fromRawJson(response.toString());
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  /// Función para realizar el avistamiento
  Future<void> postSighting({required PersonModel character}) async {
    final Map<String, dynamic> dataPost = {
      'userId': character.userId,
      'dataTime': DateTime.now().toString(),
      'character_name': character.name
    };
    try {
      await dio.post('https://jsonplaceholder.typicode.com/posts gggg',
          data: jsonEncode(dataPost));

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

    /// En este punto le asigno un valor al id del personaje
    /// para enviar al post del avistamieto.
    for (var i = 0; i < _persons.length; i++) {
      _persons[i].userId = 1 + i;
    }
    return _persons;
  }

  PeopleModel? get people {
    return _people;
  }

  void clearArray() {
    _starShips = [];
    _vehicles = [];
    notifyListeners();
  }

  void characterSelected({required PersonModel person}) {
    starWarsCharacter = StarWarsCharacter(
      character: person,
      starShips: _starShips,
      vehicles: _vehicles,
      homeWorld: homeWorldModel,
    );
    notifyListeners();
  }

  StarWarsCharacter? get starWarsCharacter {
    return _starWarsCharacter;
  }

  set starWarsCharacter(StarWarsCharacter? value) {
    _starWarsCharacter = value;
    notifyListeners();
  }

  HomeWorldModel? get homeWorldModel => _homeWorldModel;
  set homeWorldModel(HomeWorldModel? value) {
    _homeWorldModel = value;
    notifyListeners();
  }
}

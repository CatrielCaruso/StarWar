import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:star_wars/core/dio.core.dart';
import 'package:star_wars/models/models.dart';


class StarWarsProvider with ChangeNotifier, DioClient {
  late PeopleModel _people;
  late List<PersonModel> _persons = [];
  late List<PersonModel> auxPersons = [];
  late List<StarShipModel> starShips = [];
  late List<VehicleModel> vehicles = [];

  int _page = 1;
  bool _finishedFetch = false;
  Future<void> getPeople() async {
    _finishedFetch = false;
    try {
      final Response<String> response = await dio.get(
        'https://swapi.dev/api/people/?page=${_page.toString()}',
      );
      final Map<String, dynamic> responseData = jsonDecode(
        response.toString(),
      );
      _people = PeopleModel.fromJson(responseData);
      auxPersons = _persons;
      finishedFetch = true;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getStarShip({required String pathStarShip}) async {
    try {
      final Response<String> response = await dio.get(
        pathStarShip,
      );

      starShips.add(
        StarShipModel.fromRawJson(
          response.toString(),
        ),
      );

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getVehicle({required String pathVehicle}) async {
    try {
      final Response<String> response = await dio.get(
        pathVehicle,
      );

      vehicles.add(
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

  bool get finishedFetch => _finishedFetch;
  set finishedFetch(bool value) {
    _finishedFetch = value;
    notifyListeners();
  }

  List<PersonModel> get persons {
    _persons = [...auxPersons, ...people.persons];
    return _persons;
  }

  PeopleModel get people {
    return _people;
  }
}

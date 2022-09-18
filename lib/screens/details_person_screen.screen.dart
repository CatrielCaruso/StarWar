import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:star_wars/providers/star_wars.provider.dart';
import 'package:star_wars/models/models.dart';

class DetailsPersonScreen extends StatefulWidget {
  final PersonModel person;
  const DetailsPersonScreen({super.key, required this.person});

  @override
  State<DetailsPersonScreen> createState() => _DetailsPersonScreenState();
}

class _DetailsPersonScreenState extends State<DetailsPersonScreen> {
  late final StarWarsProvider providerRead = context.read<StarWarsProvider>();
  late final StarWarsProvider providerWatch = context.watch<StarWarsProvider>();
  late bool finishedFetch = false;

  @override
  void initState() {
    _initFetch();

    super.initState();
  }

  Future<void> _initFetch() async {
    try {
      setState(() {
        finishedFetch = false;
      });
      List<Future<void>> providerList = [];
      if (widget.person.hasStarShip) {
        for (String pathStarShip in widget.person.starships!) {
          providerList
              .add(providerRead.getStarShip(pathStarShip: pathStarShip));
        }
      }

      if (widget.person.hasVehicles) {
        for (String pathVehicle in widget.person.vehicles!) {
          providerList.add(
            providerRead.getVehicle(pathVehicle: pathVehicle),
          );
        }
      }
      await Future.wait(providerList);
      setState(() {
        finishedFetch = true;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (finishedFetch)
          ? Center(
              child: Text('Hola Mundo'),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:star_wars/providers/star_wars.provider.dart';
import 'package:star_wars/models/models.dart';
import 'package:star_wars/themes/themes.themes.dart';

class CharacterScreen extends StatefulWidget {
  final PersonModel person;
  const CharacterScreen({super.key, required this.person});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late final StarWarsProvider providerRead = context.read<StarWarsProvider>();
  late final StarWarsProvider providerWatch = context.watch<StarWarsProvider>();
  bool finishedFetch = false;

  List<Future<void>> providerList = [];
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
      if (widget.person.hasStarShip) {
        addPath(paths: widget.person.starships!);
      }

      if (widget.person.hasVehicles) {
        addPath(paths: widget.person.vehicles!);
      }
      await Future.wait(providerList);

      /// En este punto creo el objeto con toda la
      /// información que necesito para mostrar en esta segunda pantalla
      /// y para enviar.
      providerRead.characterSelected(person: widget.person);
      setState(() {
        finishedFetch = true;
      });
    } catch (e) {}
  }

  /// Esta función arma todas las llamdas a la api
  /// para ser ejecutada en el siguiete paso del programa.
  void addPath({required List<String> paths}) {
    for (String path in paths) {
      if (paths.contains('starships')) {
        providerList.add(providerRead.getStarShip(pathStarShip: path));
      } else {
        providerList.add(
          providerRead.getVehicle(pathVehicle: path),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomStylesTheme.blueLightColor,
          title: const Text(
            'Character',
            style: CustomStylesTheme.titleL24_28_semibold,
          ),
          centerTitle: true,
        ),
        body: (finishedFetch)
            ? CharacterScreenDetails(
                starWarsCharacter: providerWatch.starWarsCharacter!,
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class CharacterScreenDetails extends StatelessWidget {
  final StarWarsCharacter starWarsCharacter;
  const CharacterScreenDetails({
    super.key,
    required this.starWarsCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        color: CustomStylesTheme.gray100Color,
        border: Border.all(width: 1.5, color: CustomStylesTheme.gray200Color),
      ),
      child: Row(
        children: [
          Text(starWarsCharacter.character!.name!),
        ],
      ),
    );
  }
}

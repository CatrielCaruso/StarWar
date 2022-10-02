import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:star_wars/models/models.dart';
import 'package:star_wars/providers/star_wars.provider.dart';
import 'package:star_wars/themes/message.themes.dart';
import 'package:star_wars/themes/themes.themes.dart';
import 'package:star_wars/widgets/widgets.dart';

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

      /// Paths para traer los objetos de las naves del personaje.
      if (widget.person.hasStarShip) {
        await addPaths(paths: widget.person.starships!);
      }

      /// Paths para traer los objetos de los vehículos del personaje.
      if (widget.person.hasVehicles) {
        await addPaths(paths: widget.person.vehicles!);
      }

      /// Path para traer el planeta del personaje
      if (widget.person.hasHomeWord) {
        await addPaths(path: widget.person.homeworld!);
      }

      /// En este punto creo el objeto con toda la
      /// información que necesito para mostrar en esta segunda pantalla
      /// y para enviar.
      providerRead.characterSelected(person: widget.person);
      setState(() {
        finishedFetch = true;
      });
    } catch (e) {
      MessageTheme.buildMessage(
        context: context,
        buttonNavigator: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        willPopScopeNavigator: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    }
  }

  /// Esta función arma todas las llamdas a la api
  /// para ser ejecutada en el siguiete paso del programa.
  Future<void> addPaths({List<String>? paths, String? path}) async {
    if (path != null) {
      await providerRead.getHomeWorld(pathHomeWorld: path);
      return;
    }

    for (String path in paths!) {
      if (path.contains('starships')) {
        await providerRead.getStarShip(pathStarShip: path);
      } else {
        await providerRead.getVehicle(pathVehicle: path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomStylesTheme.blueLightColor,
          title: const Text(
            'Character',
            style: CustomStylesTheme.titleL24_28_semibold,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_circle_up_sharp),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        body: (finishedFetch)
            ? Padding(
                padding: const EdgeInsets.all(24),
                child: CharacterScreenDetailsWidget(
                  starWarsCharacter: providerWatch.starWarsCharacter!,
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

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
        await addPathsTransport(paths: widget.person.starships!);
      }

      /// Paths para traer los objetos de los vehículos del personaje.
      if (widget.person.hasVehicles) {
        await addPathsTransport(paths: widget.person.vehicles!);
      }

      /// Path para traer el planeta del personaje
      await addPathHomeWord(pathHomeWorld: widget.person.homeworld!);

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
  Future<void> addPathsTransport({required List<String> paths}) async {
    for (String path in paths) {
      if (path.contains('starships')) {
        await providerRead.getStarShip(pathStarShip: path);
      } else {
        await providerRead.getVehicle(pathVehicle: path);
      }
    }
  }

  Future<void> addPathHomeWord({required String pathHomeWorld}) async {
    await providerRead.getHomeWorld(pathHomeWorld: pathHomeWorld);
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
            ? Padding(
                padding: const EdgeInsets.all(24),
                child: CharacterScreenDetails(
                  starWarsCharacter: providerWatch.starWarsCharacter!,
                ),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Color de piel: ',
                          style: CustomStylesTheme.titleXS16_20_semibold,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          '${starWarsCharacter.character!.skinColor}',
                          style: CustomStylesTheme.titleXS16_20.copyWith(
                              fontFamily: CustomStylesTheme.fontFamilyFranklin),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Planeta: ',
                          style: CustomStylesTheme.titleXS16_20_semibold,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          '${starWarsCharacter.homeWorld!.name}',
                          style: CustomStylesTheme.titleXS16_20.copyWith(
                              fontFamily: CustomStylesTheme.fontFamilyFranklin),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Color de ojo: ',
                          style: CustomStylesTheme.titleXS16_20_semibold,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          '${starWarsCharacter.character!.eyeColor}',
                          style: CustomStylesTheme.titleXS16_20.copyWith(
                              fontFamily: CustomStylesTheme.fontFamilyFranklin),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Color de pelo: ',
                          style: CustomStylesTheme.titleXS16_20_semibold,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          '${starWarsCharacter.character!.hairColor}',
                          style: CustomStylesTheme.titleXS16_20.copyWith(
                              fontFamily: CustomStylesTheme.fontFamilyFranklin),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1.5,
            color: CustomStylesTheme.primaryColor,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Vehículos: ',
            style: CustomStylesTheme.titleXS16_20_semibold,
          ),
          const SizedBox(
            height: 2,
          ),
          if (starWarsCharacter.vehicles!.isNotEmpty)
            ...starWarsCharacter.vehicles!.map(
              (item) => Text(
                '- ${item.name}',
                style: CustomStylesTheme.titleXS16_20
                    .copyWith(fontFamily: CustomStylesTheme.fontFamilyFranklin),
              ),
            )
          else
            Text(
              'Sin Vehículos',
              style: CustomStylesTheme.titleXS16_20
                  .copyWith(fontFamily: CustomStylesTheme.fontFamilyFranklin),
            ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1.5,
            color: CustomStylesTheme.primaryColor,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Naves: ',
            style: CustomStylesTheme.titleXS16_20_semibold,
          ),
          const SizedBox(
            height: 2,
          ),
          if (starWarsCharacter.starShips!.isNotEmpty)
            ...starWarsCharacter.starShips!.map(
              (item) => Text(
                '- ${item.name}',
                style: CustomStylesTheme.titleXS16_20
                    .copyWith(fontFamily: CustomStylesTheme.fontFamilyFranklin),
              ),
            )
          else
            Text(
              'Sin naves',
              style: CustomStylesTheme.titleXS16_20
                  .copyWith(fontFamily: CustomStylesTheme.fontFamilyFranklin),
            ),
        ],
      ),
    );
  }
}

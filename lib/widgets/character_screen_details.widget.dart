import 'package:flutter/material.dart';

import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'package:star_wars/models/star_wars_character.dart';
import 'package:star_wars/providers/star_wars.provider.dart';
import 'package:star_wars/screens/message_error.screen.dart';
import 'package:star_wars/themes/themes.themes.dart';
import 'package:star_wars/widgets/loader_text.widget.dart';
import 'package:star_wars/widgets/shared/details_character_column.widget.dart';

class CharacterScreenDetailsWidget extends StatelessWidget {
  final StarWarsCharacter starWarsCharacter;
  const CharacterScreenDetailsWidget({
    super.key,
    required this.starWarsCharacter,
  });

  Future<void> _onSighting({required BuildContext context}) async {
    try {
      context.loaderOverlay.show(
        widget: const LoadingTextWidget(title: 'Enviando...'),
      );
      await context
          .read<StarWarsProvider>()
          .postSighting(character: starWarsCharacter.character!);
      context.loaderOverlay.hide();

      // ignore: use_build_context_synchronously
      _showDialog(context);
    } catch (e) {
      Navigator.pushNamed(context, MessageErrorScreen.routeName);
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Avistamiento realizado con exito."),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("Volver"),
                onPressed: () {
                  //Navigator.pushNamed(context, "/screen1");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

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
                  child: DetailsCharacterColumnWidget(
                primaryTitle: 'Color de piel: ',
                primaryText: starWarsCharacter.character!.skinColor!,
                secondaryTitle: 'Planeta: ',
                secondartyText: starWarsCharacter.homeWorld!.name!,
              )),
              Expanded(
                child: DetailsCharacterColumnWidget(
                  primaryTitle: 'Color de ojo: ',
                  primaryText: starWarsCharacter.character!.eyeColor!,
                  secondaryTitle: 'Color de pelo: ',
                  secondartyText: starWarsCharacter.character!.hairColor!,
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
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => _onSighting(context: context),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const CircleBorder(
                    side: BorderSide(
                      width: 5,
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(30)),
                backgroundColor: MaterialStateProperty.all(
                    CustomStylesTheme.red1Color), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (!states.contains(MaterialState.pressed)) {
                    return null;
                  }
                  return CustomStylesTheme.blueLightColor;
                }),
              ),
              child: const Text(
                'Avisar',
                style: CustomStylesTheme.titleXS16_20_semibold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

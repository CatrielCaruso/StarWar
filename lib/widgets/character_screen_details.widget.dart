import 'package:flutter/material.dart';

import 'package:star_wars/models/star_wars_character.dart';
import 'package:star_wars/themes/themes.themes.dart';
import 'package:star_wars/widgets/shared/details_character_column.widget.dart';

class CharacterScreenDetailsWidget extends StatelessWidget {
  final StarWarsCharacter starWarsCharacter;
  const CharacterScreenDetailsWidget({
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
              onPressed: () {},
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

import 'package:flutter/material.dart';

import 'package:star_wars/models/person.model.dart';
import 'package:star_wars/themes/themes.themes.dart';
import 'package:star_wars/widgets/widgets.dart';

class HomeScreenPersonItemWidget extends StatelessWidget {
  final PersonModel person;
  const HomeScreenPersonItemWidget({
    Key? key,
    required this.person,
  }) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: DetailsCharacterColumnWidget(
              primaryTitle: 'Nombre',
              primaryText: person.name!,
              secondaryTitle: 'Altura',
              secondartyText: person.height!,
            ),
          ),
          Expanded(
            child: DetailsCharacterColumnWidget(
              primaryTitle: 'Peso',
              primaryText: person.mass!,
              secondaryTitle: 'Sexo',
              secondartyText: person.gender!,
            ),
          ),
        ],
      ),
    );
  }
}
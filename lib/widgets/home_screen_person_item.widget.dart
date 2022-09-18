import 'package:flutter/material.dart';

import 'package:star_wars/models/models.dart';
import 'package:star_wars/themes/themes.themes.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nombre: ',
                      style: CustomStylesTheme.titleXS16_20_semibold,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${person.name}',
                      style: CustomStylesTheme.titleXS16_20.copyWith(
                          fontFamily: CustomStylesTheme.fontFamilyFranklin),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Altura: ',
                      style: CustomStylesTheme.titleXS16_20_semibold,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${person.height}',
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
                      'Peso: ',
                      style: CustomStylesTheme.titleXS16_20_semibold,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${person.mass}',
                      style: CustomStylesTheme.titleXS16_20.copyWith(
                          fontFamily: CustomStylesTheme.fontFamilyFranklin),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sexo: ',
                      style: CustomStylesTheme.titleXS16_20_semibold,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${person.gender}',
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
    );
  }
}
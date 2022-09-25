import 'package:flutter/material.dart';

import 'package:star_wars/themes/themes.themes.dart';

class DetailsCharacterColumnWidget extends StatelessWidget {
  final String primaryTitle;
  final String primaryText;
  final String secondaryTitle;
  final String secondartyText;
  const DetailsCharacterColumnWidget({
    super.key,
    required this.primaryTitle,
    required this.primaryText,
    required this.secondaryTitle,
    required this.secondartyText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              primaryTitle,
              style: CustomStylesTheme.titleXS16_20_semibold,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              primaryText,
              style: CustomStylesTheme.titleXS16_20
                  .copyWith(fontFamily: CustomStylesTheme.fontFamilyFranklin),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondaryTitle,
              style: CustomStylesTheme.titleXS16_20_semibold,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              secondartyText,
              style: CustomStylesTheme.titleXS16_20
                  .copyWith(fontFamily: CustomStylesTheme.fontFamilyFranklin),
            ),
          ],
        ),
      ],
    );
  }
}
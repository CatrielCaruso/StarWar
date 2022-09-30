import 'package:flutter/material.dart';

import 'package:star_wars/themes/themes.themes.dart';

class OutlineButtonWidget extends StatelessWidget {
  final VoidCallback submitFunction;
  final String text;

  const OutlineButtonWidget({
    super.key,
    required this.submitFunction,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: submitFunction,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
          shadowColor: Colors.transparent,

          textStyle: CustomStylesTheme.bodyM16_26_medium
              .copyWith(fontFamily: CustomStylesTheme.fontFamilyFranklin),

          //onSurface: CustomStylesTheme.gray200Color.withOpacity(0.12),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: CustomStylesTheme.green900Color,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

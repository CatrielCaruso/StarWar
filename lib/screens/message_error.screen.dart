import 'package:flutter/material.dart';

import 'package:star_wars/themes/themes.themes.dart';
import 'package:star_wars/widgets/widgets.dart';

class MessageErrorScreen extends StatelessWidget {
  static String routeName = 'messageErrorScreen';
  const MessageErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/feedback_negative1.png'),
                  Text(
                    'Se produjo un error inesperado.',
                    textAlign: TextAlign.center,
                    style: CustomStylesTheme.displayL36_40_semibold.copyWith(
                        fontFamily: CustomStylesTheme.fontFamilyAlliance2,
                        color: CustomStylesTheme.secondaryRed500Color),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Por favor vuelvalo a interntar más tarde.',
                    textAlign: TextAlign.center,
                    style: CustomStylesTheme.titleXS16_20.copyWith(
                      color: CustomStylesTheme.green900Color,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            OutlineButtonWidget(
                text: 'Aceptar',
                submitFunction: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}

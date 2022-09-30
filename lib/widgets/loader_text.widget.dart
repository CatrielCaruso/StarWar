import 'package:flutter/material.dart';

import 'package:star_wars/themes/themes.themes.dart';

class LoadingTextWidget extends StatelessWidget {
  final String title;
  const LoadingTextWidget({Key? key, this.title = 'Cargando...'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: CustomStylesTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: [
            const CircularProgressIndicator(
              color: CustomStylesTheme.greenColor,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: CustomStylesTheme.bodyM16_26
                  .copyWith(color: CustomStylesTheme.green900Color),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/providers/star_wars.provider.dart';

import 'package:star_wars/themes/themes.themes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomStylesTheme.gray100Color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: ClipOval(
                child: Image.asset('assets/img/baby_yoda.png'),
              ),
            ),
          ),
          const Divider(
            height: 1.5,
            color: CustomStylesTheme.gray500Color,
          ),
          Expanded(
            child: FlutterSwitch(
              width: 125.0,
              height: 55.0,
              valueFontSize: 25.0,
              toggleSize: 45.0,
              value: context.watch<StarWarsProvider>().onSwitch,
              borderRadius: 30.0,
              padding: 8.0,
              showOnOff: true,
              activeColor: CustomStylesTheme.primaryColor,
              onToggle: (val) {
                context.read<StarWarsProvider>().onSwitch = val;
              },
            ),
          ),
        ],
      ),
    );
  }
}

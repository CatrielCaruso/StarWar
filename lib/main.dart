import 'package:flutter/material.dart';

import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'package:star_wars/routes/routes.route.dart';
import 'package:star_wars/themes/themes.themes.dart';
import 'package:star_wars/widgets/loader_text.widget.dart';
import 'providers/star_wars.provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => StarWarsProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: CustomStylesTheme.overlayColor,
      overlayOpacity: 0.3,
      overlayWidget: const LoadingTextWidget(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.initialRoute,
        theme: CustomStylesTheme.mainTheme,
      ),
    );
  }
}

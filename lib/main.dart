import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:star_wars/routes/routes.route.dart';
import 'package:star_wars/themes/themes.themes.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
      theme: CustomStylesTheme.mainTheme,
    );
  }
}

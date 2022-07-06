import 'package:flutter/material.dart';
import 'package:pokedex/model/api/repository.dart';

import 'package:pokedex/presenter/pokemon_controller.dart';
import 'package:pokedex/view/details_page.dart';
import 'package:pokedex/model/json_poke.dart';
import 'package:pokedex/view/pokedex_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonController(Repository()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final arguments = settings.arguments;
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const PokedexPage());
          case '/details':
            return MaterialPageRoute(
                builder: (context) => DetailsPage(
                      pokemon: arguments as Pokemon,
                    ));
        }
        return null;
      },
    );
  }
}

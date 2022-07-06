import 'package:flutter/cupertino.dart';
import 'package:pokedex/model/api/repository.dart';
import 'package:pokedex/model/json_poke.dart';

import 'package:provider/provider.dart';

class PokemonController with ChangeNotifier {
  final Repository repository;

  PokemonController(this.repository);

  List<Pokemon> pokeList = [];
  bool loading = true;

  void getPokemon() async {
    loading = true;
    pokeList = await repository.getPokemon();
    loading = false;

    notifyListeners();
  }
}

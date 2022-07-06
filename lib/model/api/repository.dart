import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/model/json_poke.dart';

class Repository {
  Future<List<Pokemon>> getPokemon() async {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=30&page=0');

    List<Pokemon> pokeList = [];
    final result = await http.get(url);

    if (result.statusCode == 200) {
      Map json = const JsonDecoder().convert(result.body);
      for (var element in (json['data'] as List)) {
        pokeList.add(Pokemon.fromJson(element));
      }
    }
    return pokeList;
  }
}

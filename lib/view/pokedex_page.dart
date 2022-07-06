import 'package:flutter/material.dart';
import 'package:pokedex/presenter/pokemon_controller.dart';
import 'package:provider/provider.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  void initState() {
    Provider.of<PokemonController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png'),
          )
        ],
      ),
      body: Stack(
        children: [
          Consumer<PokemonController>(builder: (_, pokemon, snapshot) {
            return ListView.builder(
              itemCount: pokemon.pokeList.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/details',
                          arguments: pokemon.pokeList[index]);
                    },
                    leading: Image.network(
                        pokemon.pokeList[index].thumbnailImage ?? ''),
                    title: Text(pokemon.pokeList[index].name ?? ''),
                    trailing: Text(
                      '#${pokemon.pokeList[index].number}',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                );
              }),
            );
          }),
          if (context.watch<PokemonController>().loading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

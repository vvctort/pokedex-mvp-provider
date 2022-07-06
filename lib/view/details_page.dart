import 'package:flutter/material.dart';
import 'package:pokedex/model/json_poke.dart';

class DetailsPage extends StatelessWidget {
  Pokemon pokemon;
  DetailsPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name ?? '')),
      body: Column(
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 300),
                        width: 400,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('#${pokemon.number}'),
                      ),
                      Image.network(pokemon.thumbnailImage ?? ''),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(pokemon.description ?? ''),
                  const SizedBox(
                    height: 15,
                  ),
                  Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Tipo:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Text(pokemon.type
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', '')
                          .replaceAll(',', ' ')),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Fraquezas:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Text(pokemon.weakness
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', '')
                          .replaceAll(',', ' ')),
                      Expanded(child: Container()),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

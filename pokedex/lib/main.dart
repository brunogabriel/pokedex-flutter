import 'package:flutter/material.dart';
import 'package:pokedex/home/presentation/widgets/pokemon_card.dart';
import 'package:pokedex/theme/colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // https://stackoverflow.com/questions/65949171/flutter-list-items-in-mixed-layout-for-each-two-items

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokédex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: PokemonCard(
                        name: 'Bulbasaur',
                        number: '#001',
                        imageLink:
                            'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/001.png',
                        types: ['Leaf', 'Poison'],
                        color: lightGreen,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: PokemonCard(
                        name: 'Bulbasaur',
                        number: '#001',
                        imageLink:
                            'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/001.png',
                        types: ['Leaf', 'Poison'],
                        color: lightGreen,
                      ),
                    ),
                  )

                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 16.0),
                  //     child: PokemonCard(),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 16,
                  // ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(right: 16.0),
                  //     child: PokemonCard(),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ));
  }
}

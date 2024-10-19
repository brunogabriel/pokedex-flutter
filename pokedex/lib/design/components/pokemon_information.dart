import 'package:flutter/material.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Create spacing
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('# 6'),
              SizedBox(height: 10.0),
              Text('Charmander'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Fire')],
          )
        ],
      ),
    );
  }
}

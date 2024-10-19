import 'package:flutter/material.dart';
import '../base/spacing.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({
    super.key,
    required this.name,
    required this.number,
    required this.types,
  });

  final String name;
  final String number;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    // TODO: Create spacing
    return Padding(
      padding: const EdgeInsets.all(Spacing.kS),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('# $number'),
              const SizedBox(height: 10.0),
              Text(name),
            ],
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(types.join(' '))])
        ],
      ),
    );
  }
}

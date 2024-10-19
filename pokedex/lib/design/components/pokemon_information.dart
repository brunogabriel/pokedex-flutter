import 'package:flutter/material.dart';
import '../base/spacing.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({
    super.key,
    required this.name,
  });

  final String name;

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
              const Text('# 6'),
              const SizedBox(height: 10.0),
              Text(name),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Anytype')],
          )
        ],
      ),
    );
  }
}

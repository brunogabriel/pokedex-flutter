import 'package:flutter/material.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonWidget extends StatelessWidget {
  final String name, number, thumbnail;

  const PokemonWidget({
    Key? key,
    required this.name,
    required this.number,
    required this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => {
          // Stub
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.network(
                thumbnail,
                height: 120,
                width: 120,
              ),
            ),
            Text(
              name.firstLetterCapitalized(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '#$number',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

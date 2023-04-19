import 'package:flutter/material.dart';

class PokemonCardWidget extends StatelessWidget {
  const PokemonCardWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4.0,
      child: InkWell(
        child: SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}

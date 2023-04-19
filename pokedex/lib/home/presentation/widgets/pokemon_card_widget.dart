import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonCardWidget extends StatelessWidget {
  const PokemonCardWidget({
    Key? key,
    required this.name,
    required this.sprite,
  }) : super(key: key);

  final String name;
  final String sprite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: theme.cardTheme.elevation ?? 0.0,
      child: InkWell(
        child: SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.network(sprite),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: theme.textTheme.headline5
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              '${name} - ${name}',
                              style: theme.textTheme.subtitle1,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Last known location',
                        style: theme.textTheme.caption?.copyWith(fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          name,
                          style: theme.textTheme.subtitle1,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

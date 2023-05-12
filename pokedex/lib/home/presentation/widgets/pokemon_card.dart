import 'package:flutter/material.dart';
import 'package:pokedex/theme/opacity.dart';
import 'package:pokedex/theme/spaces.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.name,
    required this.number,
    required this.imageLink,
    required this.types,
    required this.color,
    this.onPressedAction,
  }) : super(key: key);

  final String name;
  final String number;
  final String imageLink;
  final List<String> types;
  final Color color;
  final VoidCallbackAction? onPressedAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: kDefaultSpace,
              top: kDefaultSpace,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                number,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: kDefaultSpace,
                  color: Colors.black.withOpacity(0.2),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultSpace),
            child: Text(
              name,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  if (types.isEmpty) ...{
                    const SizedBox.shrink()
                  } else if (types.length == 1) ...{
                    _buildPokemonType(types[0])
                  } else ...{
                    ...[
                      _buildPokemonType(types[0]),
                      const SizedBox(height: kMinimumSpace),
                      _buildPokemonType(types[1])
                    ]
                  }
                ],
              ),
              SizedBox(
                width: 107,
                height: 107,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 96,
                        height: 96,
                        child: Image.asset(
                          'assets/images/pokeball.png',
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SizedBox(
                          width: 96,
                          height: 96,
                          child: Image.network(imageLink),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPokemonType(String type) {
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultSpace),
      child: Container(
        width: 80.0,
        padding: const EdgeInsets.symmetric(
          horizontal: kSmallSpace,
          vertical: kMinimumSpace,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultSpace),
          color: Colors.white.withOpacity(kTypeOpacity),
        ),
        child: Text(
          type,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

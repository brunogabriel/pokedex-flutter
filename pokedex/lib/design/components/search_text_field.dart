import 'package:flutter/material.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/design/constants/pokedex_theme_data.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.enabledComponent = true,
    required this.hint,
  }) : super(key: key);

  final bool enabledComponent;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextField(
      enabled: enabledComponent,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        filled: true,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        fillColor: PokedexThemeData.greyLevelLight,
        hintText: 'What Pokémon are you looking for?',
        hintStyle: textTheme.bodyLarge?.copyWith(color: Colors.red),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(
            left: PokedexSpacing.kM,
            right: PokedexSpacing.kS,
          ),
          child: Icon(
            Icons.search,
            color: Colors.red,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: PokedexSpacing.kL,
          vertical: 20.0,
        ),
      ),
    );
  }
}

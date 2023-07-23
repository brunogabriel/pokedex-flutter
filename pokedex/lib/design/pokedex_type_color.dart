import 'package:flutter/material.dart';

enum PokedexTypeColor {
  fire(Color(0XFFF8A54F)),
  water(Color(0xFF559EDF)),
  grass(Color(0xFF5DBE62)),
  electric(Color(0xFFEDD53F)),
  psychic(Color(0xFFF87C7A)),
  fighting(Color(0xFFD94256)),
  ground(Color(0xFFD78555)),
  flying(Color(0xFF9BB4E8)),
  poison(Color(0xFFB563CE)),
  bug(Color(0xFF9DC130)),
  rock(Color(0xFFCEC18C)),
  ice(Color(0xFF7ED4C9)),
  ghost(Color(0xFF6970C5)),
  dragon(Color(0xFF0773C7)),
  steel(Color(0xFF5596A4)),
  fairy(Color(0xFFEF97E6)),
  normal(Color(0xFF9A9DA1)),
  dark(Color(0xFF5F606D)),
  shadow(Color(0xFF6B3A64)),
  unknown(Color(0xFFCCCCCC));

  const PokedexTypeColor(this.color);

  final Color color;
}

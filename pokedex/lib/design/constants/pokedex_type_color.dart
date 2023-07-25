import 'package:flutter/material.dart';

enum PokedexTypeColor {
  bug(Color(0xFF8CB230), Color(0XFF8BD674)),
  dark(Color(0xFF58575F), Color(0xFF6F6E78)),
  dragon(Color(0xFF0F6AC0), Color(0xFF7383B9)),
  electric(Color(0xFFEED535), Color(0xFFF2CB55)),
  fairy(Color(0xFFED6EC7), Color(0xFFEBA8C3)),
  fighting(Color(0xFFD04164), Color(0xFFEB4971)),
  fire(Color(0xFFFD7D24), Color(0xFFFFA756)),
  flying(Color(0xFF748FC9), Color(0xFF83A2E3)),
  ghost(Color(0xFF556AAE), Color(0xFF8571BE)),
  grass(Color(0xFF62B957), Color(0xFF8BBE8A)),
  ground(Color(0xFFDD7748), Color(0xFFF78551)),
  ice(Color(0xFF61CEC0), Color(0xFF91D8DF)),
  normal(Color(0xFF9DA0AA), Color(0xFFB5B9C4)),
  poison(Color(0xFFA552CC), Color(0xFF9F6E97)),
  psychic(Color(0xFFEA5D60), Color(0xFFFF6568)),
  rock(Color(0xFFBAAB82), Color(0xFFD4C294)),
  steel(Color(0xFF417D9A), Color(0xFF4C91B2)),
  water(Color(0xFF4A90DA), Color(0xFF58ABF6)),

  shadow(Color(0xFF5116A4), Color(0xFF855BBF)),
  unknown(Color(0xFF333D33), Color(0xFF707770));

  const PokedexTypeColor(this.primary, this.secundary);

  final Color primary;
  final Color secundary;
}

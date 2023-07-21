class PokemonResponse {
  PokemonResponse(this.name, this.url);

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      PokemonResponse(
        json['name'] as String,
        json['url'] as String,
      );

  final String name;
  final String url;
}

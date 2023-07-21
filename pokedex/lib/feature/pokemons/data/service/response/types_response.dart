class TypesResponse {
  TypesResponse(this.types);

  factory TypesResponse.fromJson(Map<String, dynamic> json) => TypesResponse(
        (json['types'] as List<dynamic>)
            .map((e) => ShortTypeResponse.fromJson(e))
            .toList(),
      );

  final List<ShortTypeResponse> types;
}

class ShortTypeResponse {
  ShortTypeResponse(this.slot, this.type);

  factory ShortTypeResponse.fromJson(Map<String, dynamic> json) =>
      ShortTypeResponse(
        json['slot'] as int,
        TypeResponse.fromJson(
          json['type'] as Map<String, dynamic>,
        ),
      );

  final int slot;
  final TypeResponse type;
}

class TypeResponse {
  TypeResponse(this.name, this.url);

  factory TypeResponse.fromJson(Map<String, dynamic> json) => TypeResponse(
        json['name'] as String,
        json['url'] as String,
      );

  final String name;
  final String url;
}

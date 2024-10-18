import 'package:json/json.dart';

@JsonCodable()
class NamedApiResponse {
  NamedApiResponse({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}

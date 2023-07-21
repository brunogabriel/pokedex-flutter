import 'package:equatable/equatable.dart';

class Type extends Equatable {
  const Type({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  List<Object> get props => [name, url];
}

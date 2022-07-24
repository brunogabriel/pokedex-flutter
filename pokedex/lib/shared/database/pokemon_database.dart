import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

part 'pokemon_database.g.dart';

@DriftDatabase(include: {'tables.drift'})
class PokemonDatabase extends _$PokemonDatabase {
  PokemonDatabase() : super(_openNativeDatabase());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openNativeDatabase() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'pokemon.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PokemonEntityData extends DataClass
    implements Insertable<PokemonEntityData> {
  final String name;
  final int number;
  final String url;
  PokemonEntityData(
      {required this.name, required this.number, required this.url});
  factory PokemonEntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PokemonEntityData(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      number: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['number'] = Variable<int>(number);
    map['url'] = Variable<String>(url);
    return map;
  }

  PokemonEntityCompanion toCompanion(bool nullToAbsent) {
    return PokemonEntityCompanion(
      name: Value(name),
      number: Value(number),
      url: Value(url),
    );
  }

  factory PokemonEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonEntityData(
      name: serializer.fromJson<String>(json['name']),
      number: serializer.fromJson<int>(json['number']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'number': serializer.toJson<int>(number),
      'url': serializer.toJson<String>(url),
    };
  }

  PokemonEntityData copyWith({String? name, int? number, String? url}) =>
      PokemonEntityData(
        name: name ?? this.name,
        number: number ?? this.number,
        url: url ?? this.url,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonEntityData(')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, number, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonEntityData &&
          other.name == this.name &&
          other.number == this.number &&
          other.url == this.url);
}

class PokemonEntityCompanion extends UpdateCompanion<PokemonEntityData> {
  final Value<String> name;
  final Value<int> number;
  final Value<String> url;
  const PokemonEntityCompanion({
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.url = const Value.absent(),
  });
  PokemonEntityCompanion.insert({
    required String name,
    required int number,
    required String url,
  })  : name = Value(name),
        number = Value(number),
        url = Value(url);
  static Insertable<PokemonEntityData> custom({
    Expression<String>? name,
    Expression<int>? number,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (number != null) 'number': number,
      if (url != null) 'url': url,
    });
  }

  PokemonEntityCompanion copyWith(
      {Value<String>? name, Value<int>? number, Value<String>? url}) {
    return PokemonEntityCompanion(
      name: name ?? this.name,
      number: number ?? this.number,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonEntityCompanion(')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class PokemonEntity extends Table
    with TableInfo<PokemonEntity, PokemonEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PokemonEntity(this.attachedDatabase, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  late final GeneratedColumn<int?> number = GeneratedColumn<int?>(
      'number', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [name, number, url];
  @override
  String get aliasedName => _alias ?? 'pokemon_entity';
  @override
  String get actualTableName => 'pokemon_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  PokemonEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PokemonEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  PokemonEntity createAlias(String alias) {
    return PokemonEntity(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$PokemonDatabase extends GeneratedDatabase {
  _$PokemonDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final PokemonEntity pokemonEntity = PokemonEntity(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pokemonEntity];
}

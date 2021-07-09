// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Preference extends DataClass implements Insertable<Preference> {
  final int guildId;
  final String prefix;
  Preference({required this.guildId, required this.prefix});
  factory Preference.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Preference(
      guildId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}guild_id'])!,
      prefix: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prefix'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['guild_id'] = Variable<int>(guildId);
    map['prefix'] = Variable<String>(prefix);
    return map;
  }

  PreferencesCompanion toCompanion(bool nullToAbsent) {
    return PreferencesCompanion(
      guildId: Value(guildId),
      prefix: Value(prefix),
    );
  }

  factory Preference.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Preference(
      guildId: serializer.fromJson<int>(json['guildId']),
      prefix: serializer.fromJson<String>(json['prefix']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guildId': serializer.toJson<int>(guildId),
      'prefix': serializer.toJson<String>(prefix),
    };
  }

  Preference copyWith({int? guildId, String? prefix}) => Preference(
        guildId: guildId ?? this.guildId,
        prefix: prefix ?? this.prefix,
      );
  @override
  String toString() {
    return (StringBuffer('Preference(')
          ..write('guildId: $guildId, ')
          ..write('prefix: $prefix')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(guildId.hashCode, prefix.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Preference &&
          other.guildId == this.guildId &&
          other.prefix == this.prefix);
}

class PreferencesCompanion extends UpdateCompanion<Preference> {
  final Value<int> guildId;
  final Value<String> prefix;
  const PreferencesCompanion({
    this.guildId = const Value.absent(),
    this.prefix = const Value.absent(),
  });
  PreferencesCompanion.insert({
    this.guildId = const Value.absent(),
    this.prefix = const Value.absent(),
  });
  static Insertable<Preference> custom({
    Expression<int>? guildId,
    Expression<String>? prefix,
  }) {
    return RawValuesInsertable({
      if (guildId != null) 'guild_id': guildId,
      if (prefix != null) 'prefix': prefix,
    });
  }

  PreferencesCompanion copyWith({Value<int>? guildId, Value<String>? prefix}) {
    return PreferencesCompanion(
      guildId: guildId ?? this.guildId,
      prefix: prefix ?? this.prefix,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guildId.present) {
      map['guild_id'] = Variable<int>(guildId.value);
    }
    if (prefix.present) {
      map['prefix'] = Variable<String>(prefix.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesCompanion(')
          ..write('guildId: $guildId, ')
          ..write('prefix: $prefix')
          ..write(')'))
        .toString();
  }
}

class $PreferencesTable extends Preferences
    with TableInfo<$PreferencesTable, Preference> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PreferencesTable(this._db, [this._alias]);
  final VerificationMeta _guildIdMeta = const VerificationMeta('guildId');
  late final GeneratedColumn<int?> guildId = GeneratedColumn<int?>(
      'guild_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _prefixMeta = const VerificationMeta('prefix');
  late final GeneratedColumn<String?> prefix = GeneratedColumn<String?>(
      'prefix', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant('-'));
  @override
  List<GeneratedColumn> get $columns => [guildId, prefix];
  @override
  String get aliasedName => _alias ?? 'preferences';
  @override
  String get actualTableName => 'preferences';
  @override
  VerificationContext validateIntegrity(Insertable<Preference> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guild_id')) {
      context.handle(_guildIdMeta,
          guildId.isAcceptableOrUnknown(data['guild_id']!, _guildIdMeta));
    }
    if (data.containsKey('prefix')) {
      context.handle(_prefixMeta,
          prefix.isAcceptableOrUnknown(data['prefix']!, _prefixMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guildId};
  @override
  Preference map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Preference.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PreferencesTable createAlias(String alias) {
    return $PreferencesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  late final PreferencesHelper preferencesHelper =
      PreferencesHelper(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [preferences];
}

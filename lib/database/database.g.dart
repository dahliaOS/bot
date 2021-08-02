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

class GitHubOrgDBData extends DataClass implements Insertable<GitHubOrgDBData> {
  final String name;
  final String url;
  final String avatar;
  final String? description;
  final String contact;
  final DateTime timestamp;
  GitHubOrgDBData(
      {required this.name,
      required this.url,
      required this.avatar,
      this.description,
      required this.contact,
      required this.timestamp});
  factory GitHubOrgDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GitHubOrgDBData(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      contact: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}contact'])!,
      timestamp: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['url'] = Variable<String>(url);
    map['avatar'] = Variable<String>(avatar);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    map['contact'] = Variable<String>(contact);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  GitHubOrgDBCompanion toCompanion(bool nullToAbsent) {
    return GitHubOrgDBCompanion(
      name: Value(name),
      url: Value(url),
      avatar: Value(avatar),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      contact: Value(contact),
      timestamp: Value(timestamp),
    );
  }

  factory GitHubOrgDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GitHubOrgDBData(
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String>(json['url']),
      avatar: serializer.fromJson<String>(json['avatar']),
      description: serializer.fromJson<String?>(json['description']),
      contact: serializer.fromJson<String>(json['contact']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'url': serializer.toJson<String>(url),
      'avatar': serializer.toJson<String>(avatar),
      'description': serializer.toJson<String?>(description),
      'contact': serializer.toJson<String>(contact),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  GitHubOrgDBData copyWith(
          {String? name,
          String? url,
          String? avatar,
          String? description,
          String? contact,
          DateTime? timestamp}) =>
      GitHubOrgDBData(
        name: name ?? this.name,
        url: url ?? this.url,
        avatar: avatar ?? this.avatar,
        description: description ?? this.description,
        contact: contact ?? this.contact,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('GitHubOrgDBData(')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('avatar: $avatar, ')
          ..write('description: $description, ')
          ..write('contact: $contact, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      name.hashCode,
      $mrjc(
          url.hashCode,
          $mrjc(
              avatar.hashCode,
              $mrjc(description.hashCode,
                  $mrjc(contact.hashCode, timestamp.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GitHubOrgDBData &&
          other.name == this.name &&
          other.url == this.url &&
          other.avatar == this.avatar &&
          other.description == this.description &&
          other.contact == this.contact &&
          other.timestamp == this.timestamp);
}

class GitHubOrgDBCompanion extends UpdateCompanion<GitHubOrgDBData> {
  final Value<String> name;
  final Value<String> url;
  final Value<String> avatar;
  final Value<String?> description;
  final Value<String> contact;
  final Value<DateTime> timestamp;
  const GitHubOrgDBCompanion({
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.avatar = const Value.absent(),
    this.description = const Value.absent(),
    this.contact = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  GitHubOrgDBCompanion.insert({
    required String name,
    required String url,
    required String avatar,
    this.description = const Value.absent(),
    required String contact,
    required DateTime timestamp,
  })  : name = Value(name),
        url = Value(url),
        avatar = Value(avatar),
        contact = Value(contact),
        timestamp = Value(timestamp);
  static Insertable<GitHubOrgDBData> custom({
    Expression<String>? name,
    Expression<String>? url,
    Expression<String>? avatar,
    Expression<String?>? description,
    Expression<String>? contact,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (avatar != null) 'avatar': avatar,
      if (description != null) 'description': description,
      if (contact != null) 'contact': contact,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  GitHubOrgDBCompanion copyWith(
      {Value<String>? name,
      Value<String>? url,
      Value<String>? avatar,
      Value<String?>? description,
      Value<String>? contact,
      Value<DateTime>? timestamp}) {
    return GitHubOrgDBCompanion(
      name: name ?? this.name,
      url: url ?? this.url,
      avatar: avatar ?? this.avatar,
      description: description ?? this.description,
      contact: contact ?? this.contact,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GitHubOrgDBCompanion(')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('avatar: $avatar, ')
          ..write('description: $description, ')
          ..write('contact: $contact, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $GitHubOrgDBTable extends GitHubOrgDB
    with TableInfo<$GitHubOrgDBTable, GitHubOrgDBData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GitHubOrgDBTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _contactMeta = const VerificationMeta('contact');
  late final GeneratedColumn<String?> contact = GeneratedColumn<String?>(
      'contact', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  late final GeneratedColumn<DateTime?> timestamp = GeneratedColumn<DateTime?>(
      'timestamp', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [name, url, avatar, description, contact, timestamp];
  @override
  String get aliasedName => _alias ?? 'git_hub_org_d_b';
  @override
  String get actualTableName => 'git_hub_org_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<GitHubOrgDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  GitHubOrgDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GitHubOrgDBData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GitHubOrgDBTable createAlias(String alias) {
    return $GitHubOrgDBTable(_db, alias);
  }
}

class GitHubRepoDBData extends DataClass
    implements Insertable<GitHubRepoDBData> {
  final String name;
  final String? language;
  final String url;
  final int starsCount;
  final String? description;
  final int openIssuesCount;
  final int forksCount;
  final DateTime timestamp;
  GitHubRepoDBData(
      {required this.name,
      this.language,
      required this.url,
      required this.starsCount,
      this.description,
      required this.openIssuesCount,
      required this.forksCount,
      required this.timestamp});
  factory GitHubRepoDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GitHubRepoDBData(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      language: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}language']),
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      starsCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stars_count'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      openIssuesCount: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}open_issues_count'])!,
      forksCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}forks_count'])!,
      timestamp: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String?>(language);
    }
    map['url'] = Variable<String>(url);
    map['stars_count'] = Variable<int>(starsCount);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    map['open_issues_count'] = Variable<int>(openIssuesCount);
    map['forks_count'] = Variable<int>(forksCount);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  GitHubRepoDBCompanion toCompanion(bool nullToAbsent) {
    return GitHubRepoDBCompanion(
      name: Value(name),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      url: Value(url),
      starsCount: Value(starsCount),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      openIssuesCount: Value(openIssuesCount),
      forksCount: Value(forksCount),
      timestamp: Value(timestamp),
    );
  }

  factory GitHubRepoDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GitHubRepoDBData(
      name: serializer.fromJson<String>(json['name']),
      language: serializer.fromJson<String?>(json['language']),
      url: serializer.fromJson<String>(json['url']),
      starsCount: serializer.fromJson<int>(json['starsCount']),
      description: serializer.fromJson<String?>(json['description']),
      openIssuesCount: serializer.fromJson<int>(json['openIssuesCount']),
      forksCount: serializer.fromJson<int>(json['forksCount']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'language': serializer.toJson<String?>(language),
      'url': serializer.toJson<String>(url),
      'starsCount': serializer.toJson<int>(starsCount),
      'description': serializer.toJson<String?>(description),
      'openIssuesCount': serializer.toJson<int>(openIssuesCount),
      'forksCount': serializer.toJson<int>(forksCount),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  GitHubRepoDBData copyWith(
          {String? name,
          String? language,
          String? url,
          int? starsCount,
          String? description,
          int? openIssuesCount,
          int? forksCount,
          DateTime? timestamp}) =>
      GitHubRepoDBData(
        name: name ?? this.name,
        language: language ?? this.language,
        url: url ?? this.url,
        starsCount: starsCount ?? this.starsCount,
        description: description ?? this.description,
        openIssuesCount: openIssuesCount ?? this.openIssuesCount,
        forksCount: forksCount ?? this.forksCount,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('GitHubRepoDBData(')
          ..write('name: $name, ')
          ..write('language: $language, ')
          ..write('url: $url, ')
          ..write('starsCount: $starsCount, ')
          ..write('description: $description, ')
          ..write('openIssuesCount: $openIssuesCount, ')
          ..write('forksCount: $forksCount, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      name.hashCode,
      $mrjc(
          language.hashCode,
          $mrjc(
              url.hashCode,
              $mrjc(
                  starsCount.hashCode,
                  $mrjc(
                      description.hashCode,
                      $mrjc(openIssuesCount.hashCode,
                          $mrjc(forksCount.hashCode, timestamp.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GitHubRepoDBData &&
          other.name == this.name &&
          other.language == this.language &&
          other.url == this.url &&
          other.starsCount == this.starsCount &&
          other.description == this.description &&
          other.openIssuesCount == this.openIssuesCount &&
          other.forksCount == this.forksCount &&
          other.timestamp == this.timestamp);
}

class GitHubRepoDBCompanion extends UpdateCompanion<GitHubRepoDBData> {
  final Value<String> name;
  final Value<String?> language;
  final Value<String> url;
  final Value<int> starsCount;
  final Value<String?> description;
  final Value<int> openIssuesCount;
  final Value<int> forksCount;
  final Value<DateTime> timestamp;
  const GitHubRepoDBCompanion({
    this.name = const Value.absent(),
    this.language = const Value.absent(),
    this.url = const Value.absent(),
    this.starsCount = const Value.absent(),
    this.description = const Value.absent(),
    this.openIssuesCount = const Value.absent(),
    this.forksCount = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  GitHubRepoDBCompanion.insert({
    required String name,
    this.language = const Value.absent(),
    required String url,
    required int starsCount,
    this.description = const Value.absent(),
    required int openIssuesCount,
    required int forksCount,
    required DateTime timestamp,
  })  : name = Value(name),
        url = Value(url),
        starsCount = Value(starsCount),
        openIssuesCount = Value(openIssuesCount),
        forksCount = Value(forksCount),
        timestamp = Value(timestamp);
  static Insertable<GitHubRepoDBData> custom({
    Expression<String>? name,
    Expression<String?>? language,
    Expression<String>? url,
    Expression<int>? starsCount,
    Expression<String?>? description,
    Expression<int>? openIssuesCount,
    Expression<int>? forksCount,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (language != null) 'language': language,
      if (url != null) 'url': url,
      if (starsCount != null) 'stars_count': starsCount,
      if (description != null) 'description': description,
      if (openIssuesCount != null) 'open_issues_count': openIssuesCount,
      if (forksCount != null) 'forks_count': forksCount,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  GitHubRepoDBCompanion copyWith(
      {Value<String>? name,
      Value<String?>? language,
      Value<String>? url,
      Value<int>? starsCount,
      Value<String?>? description,
      Value<int>? openIssuesCount,
      Value<int>? forksCount,
      Value<DateTime>? timestamp}) {
    return GitHubRepoDBCompanion(
      name: name ?? this.name,
      language: language ?? this.language,
      url: url ?? this.url,
      starsCount: starsCount ?? this.starsCount,
      description: description ?? this.description,
      openIssuesCount: openIssuesCount ?? this.openIssuesCount,
      forksCount: forksCount ?? this.forksCount,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (language.present) {
      map['language'] = Variable<String?>(language.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (starsCount.present) {
      map['stars_count'] = Variable<int>(starsCount.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (openIssuesCount.present) {
      map['open_issues_count'] = Variable<int>(openIssuesCount.value);
    }
    if (forksCount.present) {
      map['forks_count'] = Variable<int>(forksCount.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GitHubRepoDBCompanion(')
          ..write('name: $name, ')
          ..write('language: $language, ')
          ..write('url: $url, ')
          ..write('starsCount: $starsCount, ')
          ..write('description: $description, ')
          ..write('openIssuesCount: $openIssuesCount, ')
          ..write('forksCount: $forksCount, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $GitHubRepoDBTable extends GitHubRepoDB
    with TableInfo<$GitHubRepoDBTable, GitHubRepoDBData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GitHubRepoDBTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _languageMeta = const VerificationMeta('language');
  late final GeneratedColumn<String?> language = GeneratedColumn<String?>(
      'language', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _starsCountMeta = const VerificationMeta('starsCount');
  late final GeneratedColumn<int?> starsCount = GeneratedColumn<int?>(
      'stars_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _openIssuesCountMeta =
      const VerificationMeta('openIssuesCount');
  late final GeneratedColumn<int?> openIssuesCount = GeneratedColumn<int?>(
      'open_issues_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _forksCountMeta = const VerificationMeta('forksCount');
  late final GeneratedColumn<int?> forksCount = GeneratedColumn<int?>(
      'forks_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  late final GeneratedColumn<DateTime?> timestamp = GeneratedColumn<DateTime?>(
      'timestamp', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        name,
        language,
        url,
        starsCount,
        description,
        openIssuesCount,
        forksCount,
        timestamp
      ];
  @override
  String get aliasedName => _alias ?? 'git_hub_repo_d_b';
  @override
  String get actualTableName => 'git_hub_repo_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<GitHubRepoDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('stars_count')) {
      context.handle(
          _starsCountMeta,
          starsCount.isAcceptableOrUnknown(
              data['stars_count']!, _starsCountMeta));
    } else if (isInserting) {
      context.missing(_starsCountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('open_issues_count')) {
      context.handle(
          _openIssuesCountMeta,
          openIssuesCount.isAcceptableOrUnknown(
              data['open_issues_count']!, _openIssuesCountMeta));
    } else if (isInserting) {
      context.missing(_openIssuesCountMeta);
    }
    if (data.containsKey('forks_count')) {
      context.handle(
          _forksCountMeta,
          forksCount.isAcceptableOrUnknown(
              data['forks_count']!, _forksCountMeta));
    } else if (isInserting) {
      context.missing(_forksCountMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  GitHubRepoDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GitHubRepoDBData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GitHubRepoDBTable createAlias(String alias) {
    return $GitHubRepoDBTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  late final $GitHubOrgDBTable gitHubOrgDB = $GitHubOrgDBTable(this);
  late final $GitHubRepoDBTable gitHubRepoDB = $GitHubRepoDBTable(this);
  late final PreferencesHelper preferencesHelper =
      PreferencesHelper(this as Database);
  late final GitHubHelper gitHubHelper = GitHubHelper(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [preferences, gitHubOrgDB, gitHubRepoDB];
}

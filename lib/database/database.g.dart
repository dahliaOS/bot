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

class GitHubOrg extends DataClass implements Insertable<GitHubOrg> {
  final String name;
  final String url;
  final String avatar;
  final String? description;
  final String? email;
  final DateTime timestamp;
  GitHubOrg(
      {required this.name,
      required this.url,
      required this.avatar,
      this.description,
      this.email,
      required this.timestamp});
  factory GitHubOrg.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GitHubOrg(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
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
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  GitHubOrgsCompanion toCompanion(bool nullToAbsent) {
    return GitHubOrgsCompanion(
      name: Value(name),
      url: Value(url),
      avatar: Value(avatar),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      timestamp: Value(timestamp),
    );
  }

  factory GitHubOrg.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GitHubOrg(
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String>(json['url']),
      avatar: serializer.fromJson<String>(json['avatar']),
      description: serializer.fromJson<String?>(json['description']),
      email: serializer.fromJson<String?>(json['email']),
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
      'email': serializer.toJson<String?>(email),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  GitHubOrg copyWith(
          {String? name,
          String? url,
          String? avatar,
          String? description,
          String? email,
          DateTime? timestamp}) =>
      GitHubOrg(
        name: name ?? this.name,
        url: url ?? this.url,
        avatar: avatar ?? this.avatar,
        description: description ?? this.description,
        email: email ?? this.email,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('GitHubOrg(')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('avatar: $avatar, ')
          ..write('description: $description, ')
          ..write('email: $email, ')
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
                  $mrjc(email.hashCode, timestamp.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GitHubOrg &&
          other.name == this.name &&
          other.url == this.url &&
          other.avatar == this.avatar &&
          other.description == this.description &&
          other.email == this.email &&
          other.timestamp == this.timestamp);
}

class GitHubOrgsCompanion extends UpdateCompanion<GitHubOrg> {
  final Value<String> name;
  final Value<String> url;
  final Value<String> avatar;
  final Value<String?> description;
  final Value<String?> email;
  final Value<DateTime> timestamp;
  const GitHubOrgsCompanion({
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.avatar = const Value.absent(),
    this.description = const Value.absent(),
    this.email = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  GitHubOrgsCompanion.insert({
    required String name,
    required String url,
    required String avatar,
    this.description = const Value.absent(),
    this.email = const Value.absent(),
    required DateTime timestamp,
  })  : name = Value(name),
        url = Value(url),
        avatar = Value(avatar),
        timestamp = Value(timestamp);
  static Insertable<GitHubOrg> custom({
    Expression<String>? name,
    Expression<String>? url,
    Expression<String>? avatar,
    Expression<String?>? description,
    Expression<String?>? email,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (avatar != null) 'avatar': avatar,
      if (description != null) 'description': description,
      if (email != null) 'email': email,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  GitHubOrgsCompanion copyWith(
      {Value<String>? name,
      Value<String>? url,
      Value<String>? avatar,
      Value<String?>? description,
      Value<String?>? email,
      Value<DateTime>? timestamp}) {
    return GitHubOrgsCompanion(
      name: name ?? this.name,
      url: url ?? this.url,
      avatar: avatar ?? this.avatar,
      description: description ?? this.description,
      email: email ?? this.email,
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
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GitHubOrgsCompanion(')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('avatar: $avatar, ')
          ..write('description: $description, ')
          ..write('email: $email, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $GitHubOrgsTable extends GitHubOrgs
    with TableInfo<$GitHubOrgsTable, GitHubOrg> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GitHubOrgsTable(this._db, [this._alias]);
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
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  late final GeneratedColumn<DateTime?> timestamp = GeneratedColumn<DateTime?>(
      'timestamp', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [name, url, avatar, description, email, timestamp];
  @override
  String get aliasedName => _alias ?? 'git_hub_orgs';
  @override
  String get actualTableName => 'git_hub_orgs';
  @override
  VerificationContext validateIntegrity(Insertable<GitHubOrg> instance,
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
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
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
  GitHubOrg map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GitHubOrg.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GitHubOrgsTable createAlias(String alias) {
    return $GitHubOrgsTable(_db, alias);
  }
}

class GitHubRepo extends DataClass implements Insertable<GitHubRepo> {
  final String name;
  final String? language;
  final String url;
  final int starsCount;
  final String? description;
  final int openIssuesCount;
  final int forksCount;
  final DateTime timestamp;
  GitHubRepo(
      {required this.name,
      this.language,
      required this.url,
      required this.starsCount,
      this.description,
      required this.openIssuesCount,
      required this.forksCount,
      required this.timestamp});
  factory GitHubRepo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GitHubRepo(
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

  GitHubReposCompanion toCompanion(bool nullToAbsent) {
    return GitHubReposCompanion(
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

  factory GitHubRepo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GitHubRepo(
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

  GitHubRepo copyWith(
          {String? name,
          String? language,
          String? url,
          int? starsCount,
          String? description,
          int? openIssuesCount,
          int? forksCount,
          DateTime? timestamp}) =>
      GitHubRepo(
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
    return (StringBuffer('GitHubRepo(')
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
      (other is GitHubRepo &&
          other.name == this.name &&
          other.language == this.language &&
          other.url == this.url &&
          other.starsCount == this.starsCount &&
          other.description == this.description &&
          other.openIssuesCount == this.openIssuesCount &&
          other.forksCount == this.forksCount &&
          other.timestamp == this.timestamp);
}

class GitHubReposCompanion extends UpdateCompanion<GitHubRepo> {
  final Value<String> name;
  final Value<String?> language;
  final Value<String> url;
  final Value<int> starsCount;
  final Value<String?> description;
  final Value<int> openIssuesCount;
  final Value<int> forksCount;
  final Value<DateTime> timestamp;
  const GitHubReposCompanion({
    this.name = const Value.absent(),
    this.language = const Value.absent(),
    this.url = const Value.absent(),
    this.starsCount = const Value.absent(),
    this.description = const Value.absent(),
    this.openIssuesCount = const Value.absent(),
    this.forksCount = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  GitHubReposCompanion.insert({
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
  static Insertable<GitHubRepo> custom({
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

  GitHubReposCompanion copyWith(
      {Value<String>? name,
      Value<String?>? language,
      Value<String>? url,
      Value<int>? starsCount,
      Value<String?>? description,
      Value<int>? openIssuesCount,
      Value<int>? forksCount,
      Value<DateTime>? timestamp}) {
    return GitHubReposCompanion(
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
    return (StringBuffer('GitHubReposCompanion(')
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

class $GitHubReposTable extends GitHubRepos
    with TableInfo<$GitHubReposTable, GitHubRepo> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GitHubReposTable(this._db, [this._alias]);
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
  String get aliasedName => _alias ?? 'git_hub_repos';
  @override
  String get actualTableName => 'git_hub_repos';
  @override
  VerificationContext validateIntegrity(Insertable<GitHubRepo> instance,
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
  GitHubRepo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GitHubRepo.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GitHubReposTable createAlias(String alias) {
    return $GitHubReposTable(_db, alias);
  }
}

class GitHubRepoList extends DataClass implements Insertable<GitHubRepoList> {
  final String org;
  final List<GitHubMinimalRepo> repos;
  final DateTime timestamp;
  GitHubRepoList(
      {required this.org, required this.repos, required this.timestamp});
  factory GitHubRepoList.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GitHubRepoList(
      org: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}org'])!,
      repos: $GitHubRepoListsTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}repos']))!,
      timestamp: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['org'] = Variable<String>(org);
    {
      final converter = $GitHubRepoListsTable.$converter0;
      map['repos'] = Variable<String>(converter.mapToSql(repos)!);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  GitHubRepoListsCompanion toCompanion(bool nullToAbsent) {
    return GitHubRepoListsCompanion(
      org: Value(org),
      repos: Value(repos),
      timestamp: Value(timestamp),
    );
  }

  factory GitHubRepoList.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GitHubRepoList(
      org: serializer.fromJson<String>(json['org']),
      repos: serializer.fromJson<List<GitHubMinimalRepo>>(json['repos']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'org': serializer.toJson<String>(org),
      'repos': serializer.toJson<List<GitHubMinimalRepo>>(repos),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  GitHubRepoList copyWith(
          {String? org, List<GitHubMinimalRepo>? repos, DateTime? timestamp}) =>
      GitHubRepoList(
        org: org ?? this.org,
        repos: repos ?? this.repos,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('GitHubRepoList(')
          ..write('org: $org, ')
          ..write('repos: $repos, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(org.hashCode, $mrjc(repos.hashCode, timestamp.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GitHubRepoList &&
          other.org == this.org &&
          other.repos == this.repos &&
          other.timestamp == this.timestamp);
}

class GitHubRepoListsCompanion extends UpdateCompanion<GitHubRepoList> {
  final Value<String> org;
  final Value<List<GitHubMinimalRepo>> repos;
  final Value<DateTime> timestamp;
  const GitHubRepoListsCompanion({
    this.org = const Value.absent(),
    this.repos = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  GitHubRepoListsCompanion.insert({
    required String org,
    required List<GitHubMinimalRepo> repos,
    required DateTime timestamp,
  })  : org = Value(org),
        repos = Value(repos),
        timestamp = Value(timestamp);
  static Insertable<GitHubRepoList> custom({
    Expression<String>? org,
    Expression<List<GitHubMinimalRepo>>? repos,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (org != null) 'org': org,
      if (repos != null) 'repos': repos,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  GitHubRepoListsCompanion copyWith(
      {Value<String>? org,
      Value<List<GitHubMinimalRepo>>? repos,
      Value<DateTime>? timestamp}) {
    return GitHubRepoListsCompanion(
      org: org ?? this.org,
      repos: repos ?? this.repos,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (org.present) {
      map['org'] = Variable<String>(org.value);
    }
    if (repos.present) {
      final converter = $GitHubRepoListsTable.$converter0;
      map['repos'] = Variable<String>(converter.mapToSql(repos.value)!);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GitHubRepoListsCompanion(')
          ..write('org: $org, ')
          ..write('repos: $repos, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $GitHubRepoListsTable extends GitHubRepoLists
    with TableInfo<$GitHubRepoListsTable, GitHubRepoList> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GitHubRepoListsTable(this._db, [this._alias]);
  final VerificationMeta _orgMeta = const VerificationMeta('org');
  late final GeneratedColumn<String?> org = GeneratedColumn<String?>(
      'org', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _reposMeta = const VerificationMeta('repos');
  late final GeneratedColumnWithTypeConverter<List<GitHubMinimalRepo>, String?>
      repos = GeneratedColumn<String?>('repos', aliasedName, false,
              typeName: 'TEXT', requiredDuringInsert: true)
          .withConverter<List<GitHubMinimalRepo>>(
              $GitHubRepoListsTable.$converter0);
  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  late final GeneratedColumn<DateTime?> timestamp = GeneratedColumn<DateTime?>(
      'timestamp', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [org, repos, timestamp];
  @override
  String get aliasedName => _alias ?? 'git_hub_repo_lists';
  @override
  String get actualTableName => 'git_hub_repo_lists';
  @override
  VerificationContext validateIntegrity(Insertable<GitHubRepoList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('org')) {
      context.handle(
          _orgMeta, org.isAcceptableOrUnknown(data['org']!, _orgMeta));
    } else if (isInserting) {
      context.missing(_orgMeta);
    }
    context.handle(_reposMeta, const VerificationResult.success());
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
  GitHubRepoList map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GitHubRepoList.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GitHubRepoListsTable createAlias(String alias) {
    return $GitHubRepoListsTable(_db, alias);
  }

  static TypeConverter<List<GitHubMinimalRepo>, String> $converter0 =
      const GitHubRepoTypeConverter();
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  late final $GitHubOrgsTable gitHubOrgs = $GitHubOrgsTable(this);
  late final $GitHubReposTable gitHubRepos = $GitHubReposTable(this);
  late final $GitHubRepoListsTable gitHubRepoLists =
      $GitHubRepoListsTable(this);
  late final PreferencesHelper preferencesHelper =
      PreferencesHelper(this as Database);
  late final GitHubHelper gitHubHelper = GitHubHelper(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [preferences, gitHubOrgs, gitHubRepos, gitHubRepoLists];
}

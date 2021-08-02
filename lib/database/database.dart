import 'dart:ffi';
import 'dart:io';

import 'package:discord_bot/database/github_helper.dart';
import 'package:discord_bot/database/preferences_helper.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/open.dart';

part 'database.g.dart';

class Preferences extends Table {
  IntColumn get guildId => integer()();
  TextColumn get prefix => text().withDefault(Constant('-'))();

  @override
  Set<Column> get primaryKey => {guildId};
}

class GitHubOrgDB extends Table {
  TextColumn get name => text()();
  TextColumn get url => text()();
  TextColumn get avatar => text()();
  TextColumn get description => text().nullable()();
  TextColumn get contact => text()();
  DateTimeColumn get timestamp => dateTime()();
}

class GitHubRepoDB extends Table {
  TextColumn get name => text()();
  TextColumn get language => text().nullable()();
  TextColumn get url => text()();
  IntColumn get starsCount => integer()();
  TextColumn get description => text().nullable()();
  IntColumn get openIssuesCount => integer()();
  IntColumn get forksCount => integer()();
  DateTimeColumn get timestamp => dateTime()();
}

@UseMoor(
    tables: [Preferences, GitHubOrgDB, GitHubRepoDB],
    daos: [PreferencesHelper, GitHubHelper])
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}

QueryExecutor constructDb({bool logStatements = false}) {
  open.overrideFor(OperatingSystem.windows, _openOnWindows);

  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    final executor = LazyDatabase(() async {
      final dataDir = '.';
      final dbFile = File(p.join(dataDir, 'preferences.sqlite'));
      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return executor;
  }
  return VmDatabase.memory(logStatements: logStatements);
}

DynamicLibrary _openOnWindows() {
  final libraryNextToScript = File('sqlite3.dll');
  return DynamicLibrary.open(libraryNextToScript.path);
}

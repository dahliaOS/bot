import 'dart:ffi';
import 'dart:io';

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

@UseMoor(tables: [Preferences], daos: [PreferencesHelper])
class Database extends _$Database {
  Database._(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  static final Database instance = Database._(constructDb());
}

QueryExecutor constructDb({bool logStatements = false}) {
  open.overrideFor(OperatingSystem.windows, _openOnWindows);

  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    final executor = LazyDatabase(() async {
      final dataDir = './bin';
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

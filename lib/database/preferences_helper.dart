import 'package:discord_bot/database/database.dart';
import 'package:moor/moor.dart';

part 'preferences_helper.g.dart';

@UseDao(tables: [Preferences])
class PreferencesHelper extends DatabaseAccessor<Database>
    with _$PreferencesHelperMixin {
  final Database db;

  PreferencesHelper(this.db) : super(db);

  Future<String> getPrefixForGuild(int guildId) async {
    final guild = select(preferences);
    guild.where((tbl) => tbl.guildId.equals(guildId));
    final guilds = await guild.get();
    return guilds.first.prefix;
  }

  Future<void> createPreferences(int guildId) {
    return into(preferences).insert(
      Preference(guildId: guildId, prefix: '-'),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<void> updatePrefix(int guildId, String newPrefix) {
    return into(preferences).insert(
      Preference(guildId: guildId, prefix: newPrefix),
      mode: InsertMode.replace,
    );
  }
}

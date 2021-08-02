import 'package:discord_bot/database/database.dart';
import 'package:moor/moor.dart';

part 'github_helper.g.dart';

@UseDao(tables: [GitHubOrgDB, GitHubRepoDB])
class GitHubHelper extends DatabaseAccessor<Database> with _$GitHubHelperMixin {
  final Database db;

  GitHubHelper(this.db) : super(db);

  Future<String> getOrgData() async {
    final guild = select(gitHubOrgDB);
    guild.where((tbl) => tbl.guildId.equals(guildId));
    final guilds = await guild.get();
    return guilds.first.prefix;
  }

  Future<String> getRepoData() async {
    final guild = select(gitHubRepoDB);
    guild.where((tbl) => tbl.guildId.equals(guildId));
    final guilds = await guild.get();
    return guilds.first.prefix;
  }

  Future<void> insertOrgData(GitHubRepoDBData json) {
    GitHubOrgDBData.fromJson(json.decode(responseOrgInfo.body))
    return into(gitHubOrgDB).insert(json, mode: InsertMode.insertOrReplace);
  }

  Future<void> insertRepoData(GitHubRepoDBData data) {
    return into(gitHubRepoDB).insert(data, mode: InsertMode.insertOrReplace);
  }
}

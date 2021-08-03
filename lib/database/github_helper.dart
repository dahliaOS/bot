import 'package:discord_bot/database/database.dart';
import 'package:moor/moor.dart';

part 'github_helper.g.dart';

@UseDao(tables: [GitHubOrgs, GitHubRepos, GitHubRepoLists])
class GitHubHelper extends DatabaseAccessor<Database> with _$GitHubHelperMixin {
  final Database db;

  GitHubHelper(this.db) : super(db);

  Future<DateTime?> getLatestOrgTimestamp() async {
    final orgs = select(gitHubOrgs)
      ..orderBy([(r) => OrderingTerm.desc(r.timestamp)])
      ..limit(1);

    final org = await orgs.getSingleOrNull();
    return org?.timestamp;
  }

  Future<DateTime?> getLatestRepoTimestamp() async {
    final repos = select(gitHubRepos)
      ..orderBy([(r) => OrderingTerm.desc(r.timestamp)])
      ..limit(1);

    final repo = await repos.getSingleOrNull();
    return repo?.timestamp;
  }

  Future<DateTime?> getLatestRepoListTimestamp() async {
    final repoLists = select(gitHubRepoLists)
      ..orderBy([(r) => OrderingTerm.desc(r.timestamp)])
      ..limit(1);

    final repoList = await repoLists.getSingleOrNull();
    return repoList?.timestamp;
  }

  Future<GitHubOrg?> getOrgByName(String name) {
    final orgs = select(gitHubOrgs)
      ..where((tbl) => tbl.name.equals(name))
      ..orderBy([(r) => OrderingTerm.desc(r.timestamp)])
      ..limit(1);

    return orgs.getSingleOrNull();
  }

  Future<GitHubRepo?> getRepoByName(String name) {
    final repos = select(gitHubRepos)
      ..where((tbl) => tbl.name.equals(name))
      ..orderBy([(r) => OrderingTerm.desc(r.timestamp)])
      ..limit(1);

    return repos.getSingleOrNull();
  }

  Future<GitHubRepoList?> getRepoListByOrg(String org) {
    final repoLists = select(gitHubRepoLists)
      ..where((tbl) => tbl.org.equals(org))
      ..orderBy([(r) => OrderingTerm.desc(r.timestamp)])
      ..limit(1);

    return repoLists.getSingleOrNull();
  }

  Future<void> insertOrg(GitHubOrg org) async {
    await into(gitHubOrgs).insert(org, mode: InsertMode.insertOrReplace);
  }

  Future<void> insertRepo(GitHubRepo repo) async {
    await into(gitHubRepos).insert(repo, mode: InsertMode.insertOrReplace);
  }

  Future<void> insertRepoList(GitHubRepoList repoList) async {
    await into(gitHubRepoLists)
        .insert(repoList, mode: InsertMode.insertOrReplace);
  }

  Future<GitHubOrg> insertOrgFromJson(Map<String, dynamic> json) async {
    final name = json['name'];
    final url = json['html_url'];
    final avatar = json['avatar_url'];
    final description = json['description'];
    final email = json['email'];
    final timestamp = DateTime.now();

    final model = GitHubOrg(
      name: name,
      url: url,
      avatar: avatar,
      email: email,
      description: description,
      timestamp: timestamp,
    );

    await insertOrg(model);

    return model;
  }

  Future<GitHubRepo> insertRepoFromJson(Map<String, dynamic> json) async {
    final name = json['name'];
    final language = json['language'];
    final url = json['html_url'];
    final stargazersCount = json['stargazers_count'];
    final description = json['description'];
    final openIssuesCount = json['open_issues_count'];
    final forksCount = json['forks_count'];
    final timestamp = DateTime.now();

    final model = GitHubRepo(
      name: name,
      url: url,
      language: language,
      starsCount: stargazersCount,
      openIssuesCount: openIssuesCount,
      forksCount: forksCount,
      description: description,
      timestamp: timestamp,
    );

    await insertRepo(model);

    return model;
  }

  Future<GitHubRepoList> insertRepoListFromData(
    String org,
    List<GitHubMinimalRepo> repos,
  ) async {
    final model = GitHubRepoList(
      org: org,
      repos: repos,
      timestamp: DateTime.now(),
    );

    await insertRepoList(model);

    return model;
  }
}

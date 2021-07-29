import 'dart:convert';

import 'package:dotenv/dotenv.dart' show env;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:discord_bot/services/github_model.dart';

final githubToken = env['GITHUB_TOKEN'];
final githubUsername = env['GITHUB_USERNAME'];

GitHubOrg GitHubOrgFromJson(String str) => GitHubOrg.fromJson(json.decode(str));

GitHubRepo GitHubRepoFromJson(String str) =>
    GitHubRepo.fromJson(json.decode(str));

Future<GitHubOrg> OrgInfo() async {
  final responseOrgInfo = await http.get(
    Uri.parse('https://api.github.com/orgs/dahliaOS'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseOrgInfo.statusCode == 200) {
    return GitHubOrgFromJson(responseOrgInfo.body);
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

Future<List<GitHubRepos>> Repos() async {
  final responseRepos = await http.get(
    Uri.parse('https://api.github.com/orgs/dahliaOS/repos'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseRepos.statusCode == 200) {
    final dataReposInfo = json.decode(responseRepos.body) as List<dynamic>;
    final allNames = <GitHubRepos>[];
    for (dynamic repo in dataReposInfo) {
      allNames.add(GitHubRepos.fromJson(repo['name']));
    }
    return allNames;
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

Future<GitHubRepo> RepoInfo(String repo) async {
  final responseRepoInfo = await http.get(
    Uri.parse('https://api.github.com/repos/dahliaOS/$repo'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseRepoInfo.statusCode == 200) {
    return GitHubRepoFromJson(responseRepoInfo.body);
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

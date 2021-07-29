import 'dart:convert';

import 'package:dotenv/dotenv.dart' show env;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:discord_bot/services/github_model.dart';

final githubToken = env['GITHUB_TOKEN'];
final githubUsername = env['GITHUB_USERNAME'];

Future<GitHubOrg> getOrgInfo() async {
  final responseOrgInfo = await http.get(
    Uri.parse('https://api.github.com/orgs/dahliaOS'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseOrgInfo.statusCode == 200) {
    return GitHubOrg.fromJson(json.decode(responseOrgInfo.body));
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

Future<List<GitHubRepo>> getRepos() async {
  final responseRepos = await http.get(
    Uri.parse('https://api.github.com/orgs/dahliaOS/repos'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseRepos.statusCode == 200) {
    final dataReposInfo = json.decode(responseRepos.body) as List<dynamic>;
    final allNames = <GitHubRepo>[];
    for (final repo in dataReposInfo.cast<Map<String, dynamic>>()) {
      allNames.add(GitHubRepo.fromJson(repo));
    }
    return allNames;
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

Future<GitHubRepo> getRepoInfo(String repo) async {
  final responseRepoInfo = await http.get(
    Uri.parse('https://api.github.com/repos/dahliaOS/$repo'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseRepoInfo.statusCode == 200) {
    return GitHubRepo.fromJson(json.decode(responseRepoInfo.body));
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

import 'dart:convert';

import 'package:discord_bot/database/database.dart';
import 'package:discord_bot/discord_bot.dart';
import 'package:dotenv/dotenv.dart' show env;
import 'package:http/http.dart' as http;
import 'dart:io';

final githubToken = env['GITHUB_TOKEN'];
final githubUsername = env['GITHUB_USERNAME'];

Future<GitHubOrg> getOrgInfo() async {
  final now = DateTime.now();
  final latestAvailableTimestamp = await gitHubHelper.getLatestOrgTimestamp();

  if (latestAvailableTimestamp == null) {
    print('no data to get, populating');
    return _orgFromHttp();
  }

  final elapsedDays = now.difference(latestAvailableTimestamp).inDays;

  if (elapsedDays > 1) {
    print('data expired, refreshing');
    return _orgFromHttp();
  } else {
    print('data good to go, using db');
    return (await gitHubHelper.getOrgByName('dahliaOS'))!;
  }
}

Future<GitHubOrg> _orgFromHttp() async {
  final responseOrgInfo = await http.get(
    Uri.parse('https://api.github.com/orgs/dahliaOS'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseOrgInfo.statusCode == 200) {
    return gitHubHelper.insertOrgFromJson(json.decode(responseOrgInfo.body));
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

Future<GitHubRepoList> getRepos() async {
  final now = DateTime.now();
  final latestAvailableTimestamp = await gitHubHelper.getLatestOrgTimestamp();

  if (latestAvailableTimestamp == null) {
    print('no data to get, populating');
    return _repoListFromHttp();
  }

  final elapsedDays = now.difference(latestAvailableTimestamp).inDays;

  if (elapsedDays > 1) {
    print('data expired, refreshing');
    return _repoListFromHttp();
  } else {
    print('data good to go, using db');
    return (await gitHubHelper.getRepoListByOrg('dahliaOS'))!;
  }
}

Future<GitHubRepoList> _repoListFromHttp() async {
  final responseRepos = await http.get(
    Uri.parse('https://api.github.com/orgs/dahliaOS/repos'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseRepos.statusCode == 200) {
    final dataReposInfo = json.decode(responseRepos.body) as List<dynamic>;
    final allNames = <GitHubMinimalRepo>[];
    for (final repo in dataReposInfo.cast<Map<String, dynamic>>()) {
      allNames.add(GitHubMinimalRepo(
        name: repo['name']!,
        url: repo['html_url']!,
      ));
    }
    return gitHubHelper.insertRepoListFromData('dahliaOS', allNames);
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

Future<GitHubRepo> getRepoInfo(String repo) async {
  final now = DateTime.now();
  final latestAvailableTimestamp = await gitHubHelper.getLatestRepoTimestamp();

  if (latestAvailableTimestamp == null) {
    print('no data to get, populating');
    return _repoFromHttp(repo);
  }

  final elapsedHours = now.difference(latestAvailableTimestamp).inHours;

  if (elapsedHours > 6) {
    print('data expired, refreshing');
    return _repoFromHttp(repo);
  } else {
    print('data good to go, using db');
    return (await gitHubHelper.getRepoByName(repo))!;
  }
}

Future<GitHubRepo> _repoFromHttp(String repo) async {
  final responseRepoInfo = await http.get(
    Uri.parse('https://api.github.com/repos/dahliaOS/$repo'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseRepoInfo.statusCode == 200) {
    return gitHubHelper.insertRepoFromJson(json.decode(responseRepoInfo.body));
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

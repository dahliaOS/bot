import 'dart:convert';
import 'package:dotenv/dotenv.dart' show env;
import 'package:http/http.dart' as http;
import 'dart:io';

final githubToken = env['GITHUB_TOKEN'];
final githubUsername = env['GITHUB_USERNAME'];

Future<Map> OrgInfo() async {
  final responseOrgInfo = await http.get(
    Uri.parse('https://api.github.com/orgs/dahliaOS'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseOrgInfo.statusCode == 200) {
    Map dataOrgInfo = jsonDecode(responseOrgInfo.body);
    return dataOrgInfo;
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

Future<List<String>> Repos() async {
  var responseRepos = await http.get(
    Uri.parse('https://api.github.com/orgs/dahliaOS/repos'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseRepos.statusCode == 200) {
    final dataRepoInfo = jsonDecode(responseRepos.body) as List<dynamic>;
    final repoNames = <String>[];
    for (dynamic repo in dataRepoInfo) {
      repoNames.add(repo['name']);
    }
    return repoNames;
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

Future<Map> RepoInfo(String repo) async {
  final responseRepoInfo = await http.get(
    Uri.parse('https://api.github.com/repos/dahliaOS/$repo'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $githubUsername:$githubToken',
    },
  );
  if (responseRepoInfo.statusCode == 200) {
    Map dataRepoInfo = jsonDecode(responseRepoInfo.body);
    return dataRepoInfo;
  } else {
    throw Exception('Failed to fetch data from the GitHub API.');
  }
}

Future<void> main() async {
  var lmao = await Repos();
  print(lmao);
}

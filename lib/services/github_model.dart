class GitHubOrg {
  final String name;
  final String url;
  final String avatar;
  final String description;
  final String contact;

  const GitHubOrg({
    required this.name,
    required this.url,
    required this.avatar,
    required this.description,
    required this.contact,
  });

  factory GitHubOrg.fromJson(Map<String, dynamic> json) => GitHubOrg(
        name: json['name'],
        url: json['html_url'],
        avatar: json['avatar_url'],
        description: json['description'],
        contact: json['email'],
      );
}

class GitHubRepos {
  final String repoNames;

  const GitHubRepos({
    required this.repoNames,
  });

  factory GitHubRepos.fromJson(Map<String, dynamic> json) => GitHubRepos(
        repoNames: json['name'],
      );
}

class GitHubRepo {
  final String name;
  final String language;
  final String url;
  final int stars_count;
  final String description;
  final int open_issues_count;
  final int forks_count;

  const GitHubRepo({
    required this.name,
    required this.language,
    required this.url,
    required this.stars_count,
    required this.description,
    required this.open_issues_count,
    required this.forks_count,
  });

  factory GitHubRepo.fromJson(Map<String, dynamic> json) => GitHubRepo(
        name: json['name'],
        language: json['language'],
        url: json['html_url'],
        stars_count: json['stargazers_count'],
        description: json['description'],
        open_issues_count: json['open_issues_count'],
        forks_count: json['forks_count'],
      );
}

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

class GitHubRepo {
  final String name;
  final String? language;
  final String url;
  final int starsCount;
  final String? description;
  final int openIssuesCount;
  final int forksCount;

  const GitHubRepo({
    required this.name,
    required this.language,
    required this.url,
    required this.starsCount,
    required this.description,
    required this.openIssuesCount,
    required this.forksCount,
  });

  factory GitHubRepo.fromJson(Map<String, dynamic> json) => GitHubRepo(
        name: json['name'],
        language: json['language'],
        url: json['html_url'],
        starsCount: json['stargazers_count'],
        description: json['description'],
        openIssuesCount: json['open_issues_count'],
        forksCount: json['forks_count'],
      );
}

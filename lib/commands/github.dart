import 'dart:async';

import 'package:discord_bot/core/command.dart';
import 'package:discord_bot/services/github_services.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'package:discord_bot/utils/globals.dart';

class GitHubCommand extends Command {
  @override
  String get name => 'github';

  @override
  String get description =>
      "An utility command that shows dahliaOS' GitHub organization and repositories information";

  @override
  List<String> getUsages(CommandContext context) => [
        '${context.commandMatcher} org',
        '${context.commandMatcher} repos',
        '${context.commandMatcher} repo <name>',
      ];

  @override
  FutureOr<void> onRun(CommandContext context, List<String> arguments) async {
    if (arguments.first == 'org') {
      final GitHubOrgInfo = await OrgInfo();
      if (GitHubOrgInfo.name.isNotEmpty) {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'dahliaOS GitHub organization'
          ..url = GitHubOrgInfo.url
          ..thumbnailUrl = GitHubOrgInfo.avatar
          ..fields.add(EmbedFieldBuilder('Name', GitHubOrgInfo.name))
          ..fields
              .add(EmbedFieldBuilder('Description', GitHubOrgInfo.description))
          ..fields
              .add(EmbedFieldBuilder('Contact mail', GitHubOrgInfo.contact))));
      } else {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'API Error'
          ..description = 'Failed to fetch data from the GitHub API.'));
      }
    } else if (arguments.first == 'repos') {
      final GitHubReposInfo = await Repos();
      if (GitHubReposInfo.isNotEmpty) {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'dahliaOS GitHub repositories'
          ..description = GitHubReposInfo.map((e) => '- $e').join('\n')));
      } else {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'API Error'
          ..description = 'Failed to fetch data from the GitHub API.'));
      }
    } else if (arguments.first == 'repo') {
      final GitHubRepoInfo = await RepoInfo(arguments[1]);
      if (GitHubRepoInfo.name.isNotEmpty) {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = GitHubRepoInfo.name
          ..url = GitHubRepoInfo.url
          ..fields
              .add(EmbedFieldBuilder('Description', GitHubRepoInfo.description))
          ..fields.add(EmbedFieldBuilder('Stars', GitHubRepoInfo.stars_count))
          ..fields.add(EmbedFieldBuilder(
              'Open issues count', GitHubRepoInfo.open_issues_count))
          ..fields
              .add(EmbedFieldBuilder('Forks count', GitHubRepoInfo.forks_count))
          ..fields
              .add(EmbedFieldBuilder('Language', GitHubRepoInfo.language))));
      } else {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'API Error'
          ..description = 'Failed to fetch data from the GitHub API.'));
      }
    }
  }

  @override
  FutureOr<bool> canRun(CommandContext context, List<String> arguments) {
    try {
      if (arguments.first == 'org') {
        return arguments.length == 1;
      } else if (arguments.first == 'repos') {
        return arguments.length == 1;
      } else if (arguments.first == 'repo') {
        return arguments.length == 2;
      } else {
        return false;
      }
    } on StateError {
      return false;
    }
  }
}

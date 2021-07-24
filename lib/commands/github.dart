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
      var orgInfo = await OrgInfo();
      if (orgInfo['name'] != null) {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'dahliaOS GitHub organization'
          ..url = orgInfo['html_url']
          ..thumbnailUrl = orgInfo['avatar_url']
          ..fields.add(EmbedFieldBuilder('Name', orgInfo['name']))
          ..fields.add(EmbedFieldBuilder('Description', orgInfo['description']))
          ..fields.add(EmbedFieldBuilder('Contact mail', orgInfo['email']))));
      } else {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'API Error'
          ..description = 'Failed to fetch data from the GitHub API.'));
      }
    } else if (arguments.first == 'repos') {
      var reposInfo = await Repos();
      if (reposInfo.isNotEmpty) {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'dahliaOS GitHub repositories'
          ..description = reposInfo.map((e) => '- $e').join('\n')));
      } else {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'API Error'
          ..description = 'Failed to fetch data from the GitHub API.'));
      }
    } else if (arguments.first == 'repo') {
      var repoInfo = await RepoInfo(arguments[1]);
      if (repoInfo['name'] != null) {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = repoInfo['name']
          ..url = repoInfo['html_url']
          ..fields
              .add(EmbedFieldBuilder('Description', repoInfo['description']))
          ..fields.add(EmbedFieldBuilder('Stars', repoInfo['stargazers_count']))
          ..fields.add(EmbedFieldBuilder(
              'Open issues count', repoInfo['open_issues_count']))
          ..fields
              .add(EmbedFieldBuilder('Forks count', repoInfo['forks_count']))
          ..fields.add(EmbedFieldBuilder('Language', repoInfo['language']))));
      } else {
        await context.reply(MessageBuilder.embed(EmbedBuilder()
          ..color = embedColor
          ..title = 'API Error'
          ..description = 'Failed to fetch data from the GitHub API.'));
      }
      ;
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

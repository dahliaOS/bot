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
      final org = await getOrgInfo();
      if (org.name.isNotEmpty) {
        await context.reply(
          MessageBuilder.embed(
            EmbedBuilder()
              ..color = embedColor
              ..title = 'dahliaOS GitHub organization'
              ..url = org.url
              ..thumbnailUrl = org.avatar
              ..fields.add(EmbedFieldBuilder('Name', org.name))
              ..fields.add(EmbedFieldBuilder('Description', org.description))
              ..fields.add(EmbedFieldBuilder('Contact mail', org.contact)),
          ),
        );
      } else {
        await context.reply(
          MessageBuilder.embed(EmbedBuilder()
            ..color = embedColor
            ..title = 'API Error'
            ..description = 'Failed to fetch data from the GitHub API.'),
        );
      }
    } else if (arguments.first == 'repos') {
      final repos = await getRepos();
      print(repos);
      print(repos.map((e) => '- ${e.name}').join('\n'));
      if (repos.isNotEmpty) {
        await context.reply(
          MessageBuilder.embed(
            EmbedBuilder()
              ..color = embedColor
              ..title = 'dahliaOS GitHub repositories'
              ..description = repos.map((e) => '- ${e.name}').join('\n'),
          ),
        );
      } else {
        await context.reply(
          MessageBuilder.embed(EmbedBuilder()
            ..color = embedColor
            ..title = 'API Error'
            ..description = 'Failed to fetch data from the GitHub API.'),
        );
      }
    } else if (arguments.first == 'repo') {
      final repo = await getRepoInfo(arguments[1]);
      if (repo.name.isNotEmpty) {
        await context.reply(
          MessageBuilder.embed(
            EmbedBuilder()
              ..color = embedColor
              ..title = repo.name
              ..url = repo.url
              ..fields.add(
                  EmbedFieldBuilder('Description', repo.description ?? 'N/A'))
              ..fields.add(EmbedFieldBuilder('Stars', repo.starsCount))
              ..fields.add(
                  EmbedFieldBuilder('Open issues count', repo.openIssuesCount))
              ..fields.add(EmbedFieldBuilder('Forks count', repo.forksCount))
              ..fields
                  .add(EmbedFieldBuilder('Language', repo.language ?? 'N/A')),
          ),
        );
      } else {
        await context.reply(
          MessageBuilder.embed(EmbedBuilder()
            ..color = embedColor
            ..title = 'API Error'
            ..description = 'Failed to fetch data from the GitHub API.'),
        );
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

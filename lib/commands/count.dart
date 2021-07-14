import 'dart:async';

import 'package:discord_bot/core/command.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'package:discord_bot/utils/utils.dart';
import 'package:discord_bot/utils/globals.dart';

class CountCommand extends Command {
  @override
  String get name => 'count';

  @override
  String get description =>
      'A simple utility command to get the number of times a word has occurred on the last 100 messages.';

  @override
  List<String> getUsages(CommandContext context) => [
        '${context.commandMatcher} <word>',
      ];

  @override
  FutureOr<void> onRun(CommandContext context, List<String> arguments) async {
    var messagesCount = 0;
    context.channel.downloadMessages(limit: 100).listen((item) async {
      if (item.content
          .startsWith(await BotUtils.getPrefix(context.guild!.id.id))) {
        messagesCount;
      } else if (item.content.contains(arguments[0])) {
        messagesCount++;
      }
    }).onDone(() {
      if (messagesCount == 0) {
        context.reply(MessageBuilder.embed(
          EmbedBuilder()
            ..color = embedColor
            ..description =
                ':negative_squared_cross_mark: Found $messagesCount messages that contain `${arguments[0]}`',
        ));
      } else if (messagesCount > 0) {
        context.reply(MessageBuilder.embed(
          EmbedBuilder()
            ..color = embedColor
            ..description =
                ':white_check_mark: Found $messagesCount messages that contain `${arguments[0]}`',
        ));
      }
    });
  }

  @override
  FutureOr<bool> canRun(CommandContext context, List<String> arguments) {
    return arguments.length == 1;
  }
}

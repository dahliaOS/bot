import 'dart:async';

import 'package:discord_bot/core/command.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';

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

    context.channel.downloadMessages(limit: 100).listen((item) {
      if (item.content.contains(arguments[0])) {
        messagesCount++;
      }
    }).onDone(() {
      context.reply(MessageBuilder.content(
        'Found $messagesCount messages that contain "${arguments[0]}"',
      ));
    });
  }

  @override
  FutureOr<bool> canRun(CommandContext context, List<String> arguments) {
    return arguments.length == 1;
  }
}

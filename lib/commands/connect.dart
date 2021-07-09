import 'dart:async';

import 'package:discord_bot/core/command.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';

class ConnectCommand extends Command {
  @override
  FutureOr<bool> canRun(CommandContext context, List<String> arguments) {
    final guildMember = context.member as Member;

    return guildMember.voiceState != null;
  }

  @override
  String get description => 'Test command';

  @override
  List<String> getUsages(CommandContext context) => [context.commandMatcher];

  @override
  String get name => 'connect';

  @override
  FutureOr<void> onRun(CommandContext context, List<String> arguments) {
    final guildMember = context.member as Member;
  }
}

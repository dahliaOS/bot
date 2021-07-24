import 'dart:async';

import 'package:discord_bot/core/command.dart';
import 'package:discord_bot/discord_bot.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'package:discord_bot/utils/globals.dart';

class PrefixCommand extends Command {
  @override
  String get name => 'prefix';

  @override
  String get description =>
      'An utility command to get the current server prefix or to set a new one.';

  @override
  List<String> getUsages(context) => [
        '${context.commandMatcher} get',
        '${context.commandMatcher} set <new prefix>',
      ];

  @override
  FutureOr<void> onRun(CommandContext context, List<String> arguments) async {
    if (arguments.first == 'get') {
      final prefix = await helper.getPrefixForGuild(context.guild!.id.id);
      await context.reply(MessageBuilder.embed(EmbedBuilder()
        ..color = embedColor
        ..description = 'Current prefix is `$prefix`'));
    } else if (arguments.first == 'set') {
      final member = await context.guild?.fetchMember(context.author.id);
      executeWithPermissions(
        member: member as Member,
        permission: PermissionsConstants.manageGuild,
        onGranted: () async {
          final id = context.guild!.id.id;
          await helper.updatePrefix(id, arguments[1]);

          await context.reply(MessageBuilder.embed(EmbedBuilder()
            ..color = embedColor
            ..description =
                ':white_check_mark: Success! Prefix is now `${arguments[1]}`'));
        },
        onDenied: () async {
          await context.reply(MessageBuilder.embed(EmbedBuilder()
            ..color = embedColor
            ..description =
                ":negative_squared_cross_mark: You don't have the permissions to do this!"));
        },
      );
    }
  }

  @override
  FutureOr<bool> canRun(CommandContext context, List<String> arguments) {
    try {
      if (arguments.first == 'get') {
        return arguments.length == 1;
      } else if (arguments.first == 'set') {
        return arguments.length == 2;
      } else {
        return false;
      }
    } on StateError {
      return false;
    }
  }
}

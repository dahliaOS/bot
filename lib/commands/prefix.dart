import 'dart:async';

import 'package:discord_bot/core/command.dart';
import 'package:discord_bot/database/preferences_helper.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';

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
    if (context.guild != null) {
      if (arguments.first == 'get') {
        final prefix = await PreferencesHelper.instance
            .getPrefixForGuild(context.guild!.id.id);
        await context.reply(MessageBuilder.content(
          'Current prefix is "$prefix"',
        ));
      } else if (arguments.first == 'set') {
        final member =
            await await context.guild?.fetchMember(context.author.id);
        executeWithPermissions(
          member: member as Member,
          permission: PermissionsConstants.manageGuild,
          onGranted: () async {
            final id = context.guild!.id.id;
            await PreferencesHelper.instance.updatePrefix(id, arguments[1]);

            await context.reply(MessageBuilder.content(
              'Success! Prefix is now "${arguments[1]}"',
            ));
          },
          onDenied: () async {
            await context.reply(MessageBuilder.content(
              "You don't have the permissions to do this!",
            ));
          },
        );
      }
    }
  }

  @override
  FutureOr<bool> canRun(CommandContext context, List<String> arguments) {
    if (context.guild == null) return false;

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

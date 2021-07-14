import 'dart:async';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'package:discord_bot/utils/globals.dart';

abstract class Command {
  String get name;
  String get description;

  List<String> getUsages(CommandContext context);

  FutureOr<bool> canRun(CommandContext context, List<String> arguments);

  FutureOr<void> onRun(CommandContext context, List<String> arguments);

  FutureOr<void> onError(CommandContext context, List<String> arguments) {
    createHelpEmbed(context);
  }

  FutureOr<void> call(CommandContext context, String message) async {
    final arguments = _getArguments(
      context.message.content,
      context.commandMatcher,
    );

    if (await canRun(context, arguments)) {
      await onRun(context, arguments);
    } else {
      await onError(context, arguments);
    }
  }

  List<String> _getArguments(String content, String commandMatcher) {
    final args = <String>[];
    final matches = RegExp('([^\ \n\"\']+)').allMatches(
      content.replaceFirst(commandMatcher, ''),
    );

    for (final match in matches) {
      final group1 = match.group(1);

      args.add(group1 ?? match.group(2)!);
    }

    return args;
  }

  void createHelpEmbed(CommandContext context) async {
    final usages = getUsages(context);
    await context.reply(
      MessageBuilder.embed(
        EmbedBuilder()
          ..title = 'Usage for $name'
          ..description = description
          ..color = embedColor
          ..fields.add(
            EmbedFieldBuilder(
              'Available usages:',
              usages.map((e) => '- `$e`').join('\n'),
            ),
          ),
      ),
    );
  }

  void executeWithPermissions({
    required Member member,
    required int permission,
    required void Function() onGranted,
    required void Function() onDenied,
  }) async {
    final permissions = await member.effectivePermissions;
    if (PermissionsUtils.isApplied(permissions.raw, permission)) {
      onGranted();
    } else {
      onDenied();
    }
  }
}

import 'dart:async';

import 'package:discord_bot/core/command.dart';
import 'package:discord_bot/discord_bot.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'package:collection/collection.dart';
import 'package:discord_bot/utils/utils.dart';
import 'package:discord_bot/utils/globals.dart';

class HelpCommand extends Command {
  @override
  String get name => 'help';

  @override
  String get description => 'An utility command that shows all bot commands.';

  @override
  List<String> getUsages(CommandContext context) => [context.commandMatcher];

  @override
  FutureOr<void> onRun(CommandContext context, List<String> arguments) async {
    var gotPrefix = await BotUtils.getPrefix(context.guild!.id.id);
    if (context.guild != null) {
      await context.reply(
        MessageBuilder.embed(
          EmbedBuilder()
            ..title = 'Help'
            ..description = 'An utility command that shows all bot commands.'
            ..color = embedColor
            ..fields.add(
              EmbedFieldBuilder(
                  'Available commands:',
                  names
                      .mapIndexed((index, e) =>
                          index % 2 == 0 ? '**`$gotPrefix$e`**' : '*$e* \n')
                      .join('\n')),
            ),
        ),
      );
    }
  }

  @override
  FutureOr<bool> canRun(CommandContext context, List<String> arguments) {
    return true;
  }
}

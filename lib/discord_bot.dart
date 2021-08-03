import 'package:discord_bot/commands/count.dart';
import 'package:discord_bot/commands/help.dart';
import 'package:discord_bot/commands/prefix.dart';
import 'package:discord_bot/commands/github.dart';
import 'package:discord_bot/core/command.dart';
import 'package:discord_bot/database/database.dart';
import 'package:discord_bot/database/github_helper.dart';
import 'package:discord_bot/database/preferences_helper.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'package:dotenv/dotenv.dart' show load, env;

late final Database database;
late final PreferencesHelper helper;
late final GitHubHelper gitHubHelper;
final names = <String>[];
final List<Command> commands = [
  CountCommand(),
  PrefixCommand(),
  HelpCommand(),
  GitHubCommand(),
];

class DiscordBot {
  late Nyxx bot;
  late Commander commander;

  DiscordBot() {
    load();
    database = Database(constructDb());
    helper = database.preferencesHelper;
    gitHubHelper = database.gitHubHelper;
    final token = env['TOKEN'];
    bot = Nyxx(token!, GatewayIntents.allUnprivileged);

    // bot info
    final VER = '0.0.1';
    final SRC = 'github.com/dahliaOS/bot';
    final LCS = 'Apache 2.0';

    // fetch bot
    print('     _');
    print('   _/ \\_    version: $VER');
    print('  |  _  |   license: $LCS');
    print(' <  |_|  >  source: $SRC');
    print('  |_   _|');
    print('    \\_/');

    bot.onGuildCreate.listen((event) async {
      await helper.createPreferences(event.guild.id.id);
    });

    commander = Commander(
      bot,
      prefixHandler: (message) async {
        if (message is GuildMessage) {
          final guild = message.guild;
          final prefix = helper.getPrefixForGuild(guild.id.id);
          return prefix;
        }
      },
      beforeCommandHandler: (context) {
        if (context.author.bot) return false;

        if (context.channel is DMChannel) {
          context.channel.sendMessage(MessageBuilder.content(
            "The bot doesn't support direct messages, please use it on a server!",
          ));
          return false;
        }

        return true;
      },
    );

    registerCommands();
    commandsInfo();
  }

  void registerCommands() {
    commands
        .forEach((command) => commander.registerCommand(command.name, command));
  }
}

void commandsInfo() {
  commands.sort((a, b) => a.name.compareTo(b.name));
  for (final command in commands) {
    names.add(command.name);
    names.add(command.description);
  }
}

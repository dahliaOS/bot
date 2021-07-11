import 'package:discord_bot/commands/count.dart';
import 'package:discord_bot/commands/prefix.dart';
import 'package:discord_bot/core/command.dart';
import 'package:discord_bot/database/database.dart';
import 'package:discord_bot/database/preferences_helper.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';

late final Database database;
late final PreferencesHelper helper;

class DiscordBot {
  late Nyxx bot;
  late Commander commander;

  final List<Command> commands = [
    CountCommand(),
    PrefixCommand(),
  ];

  DiscordBot() {
    database = Database(constructDb());
    helper = database.preferencesHelper;
    const token = 'TOKEN';
    bot = Nyxx(token, GatewayIntents.allUnprivileged);
    
    // bot info
    const VER = ("0.0.1");  
    const SRC = ("github.com/dahliaOS/bot");
    const LCS = ("Apache-2.0");

    // fetch bot
    print("     _");            
    print("   _/ \\_    version: ${VER}");
    print("  |  _  |   license: ${LCS}"); 
    print(" <  |_|  >  source: ${SRC}");
    print("  |_   _|");
    print("    \\_/");  
    
    bot.onGuildCreate.listen((event) async {
      await helper.createPreferences(event.guild.id.id);
    });

    bot.onMessageReceived.listen((e) {
      if (e.message.content == '/test') {
        e.message.channel.sendMessage(MessageBuilder.content('Test works!'));
        e.message.createReaction(IGuildEmoji.fromId(863148129901346858));
      }
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
  }

  void registerCommands() {
    commands
        .forEach((command) => commander.registerCommand(command.name, command));
  }
}

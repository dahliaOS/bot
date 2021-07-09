import 'package:discord_bot/commands/count.dart';
import 'package:discord_bot/commands/prefix.dart';
import 'package:discord_bot/core/command.dart';
import 'package:discord_bot/database/preferences_helper.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';

class DiscordBot {
  late Nyxx bot;
  late Commander commander;

  final List<Command> commands = [
    CountCommand(),
    PrefixCommand(),
  ];

  DiscordBot() {
    const token = 'TOKEN';
    bot = Nyxx(token, GatewayIntents.allUnprivileged);

    bot.onGuildCreate.listen((event) async {
      await PreferencesHelper.instance.createPreferences(event.guild.id.id);
    });

    bot.onMessageReceived.listen((e) {
    if (e.message.content == "/test") {
      e.message.channel.sendMessage(MessageBuilder.content("Test works!"));
      }
    });

    commander = Commander(
      bot,
      prefixHandler: (message) async {
        print(message.channel.runtimeType);
        if (message.channel is TextGuildChannel) {
          final guild = message.channel as TextGuildChannel;
          return await PreferencesHelper.instance
              .getPrefixForGuild(guild.id.id);
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

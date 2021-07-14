import 'package:discord_bot/discord_bot.dart';

class BotUtils {
  static Future<String> getPrefix(int guildId) async =>
      helper.getPrefixForGuild(guildId);
}

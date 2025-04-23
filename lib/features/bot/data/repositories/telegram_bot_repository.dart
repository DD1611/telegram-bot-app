import '../../domain/models/telegram_bot.dart';

abstract class TelegramBotRepository {
  Future<List<TelegramBot>> getBots();
  Future<TelegramBot> getBot(String id);
  Future<void> addBot(TelegramBot bot);
  Future<void> updateBot(TelegramBot bot);
  Future<void> deleteBot(String id);
}

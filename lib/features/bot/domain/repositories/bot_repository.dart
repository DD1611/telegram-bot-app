import '../entities/bot.dart';

abstract class BotRepository {
  Future<List<Bot>> getBots(String userId);
  Future<Bot> getBot(String userId, String botId);
  Future<void> createBot(String userId, Bot bot);
  Future<void> updateBot(String userId, Bot bot);
  Future<void> deleteBot(String userId, String botId);
}

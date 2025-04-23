import 'package:flutter/foundation.dart';
import '../../domain/models/telegram_bot.dart';
import '../../data/repositories/telegram_bot_repository.dart';

class BotProvider with ChangeNotifier {
  final TelegramBotRepository _repository;
  List<TelegramBot> _bots = [];
  bool _isLoading = false;
  String? _error;

  BotProvider(this._repository);

  List<TelegramBot> get bots => _bots;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadBots() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _bots = await _repository.getBots();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addBot(TelegramBot bot) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _repository.addBot(bot);
      await loadBots();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateBot(TelegramBot bot) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _repository.updateBot(bot);
      await loadBots();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteBot(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _repository.deleteBot(id);
      await loadBots();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

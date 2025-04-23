import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/bot.dart';
import '../../domain/repositories/bot_repository.dart';
import '../bloc/bot_state.dart';

abstract class BotEvent with EquatableMixin {
  const BotEvent();

  @override
  List<Object> get props => [];
}

class BotLoadRequested extends BotEvent {}

class BotCreateRequested extends BotEvent {
  final String name;
  final String token;
  final String description;

  const BotCreateRequested({
    required this.name,
    required this.token,
    required this.description,
  });

  @override
  List<Object> get props => [name, token, description];
}

class BotUpdateRequested extends BotEvent {
  final String botId;
  final String name;
  final String description;

  const BotUpdateRequested({
    required this.botId,
    required this.name,
    required this.description,
  });

  @override
  List<Object> get props => [botId, name, description];
}

class BotDeleteRequested extends BotEvent {
  final String botId;

  const BotDeleteRequested(this.botId);

  @override
  List<Object> get props => [botId];
}

class BotBloc extends Bloc<BotEvent, BotState> {
  final BotRepository _botRepository;
  final String userId;

  BotBloc({
    required this.userId,
    required BotRepository botRepository,
  })  : _botRepository = botRepository,
        super(BotInitial()) {
    on<BotLoadRequested>(_onBotLoadRequested);
    on<BotCreateRequested>(_onBotCreateRequested);
    on<BotUpdateRequested>(_onBotUpdateRequested);
    on<BotDeleteRequested>(_onBotDeleteRequested);
  }

  Future<void> _onBotLoadRequested(
    BotLoadRequested event,
    Emitter<BotState> emit,
  ) async {
    emit(BotLoading());
    try {
      final bots = await _botRepository.getBots(userId);
      emit(BotLoaded(bots));
    } catch (e) {
      emit(BotError(e.toString()));
    }
  }

  Future<void> _onBotCreateRequested(
    BotCreateRequested event,
    Emitter<BotState> emit,
  ) async {
    emit(BotLoading());
    try {
      final bot = Bot(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: event.name,
        token: event.token,
        description: event.description,
        createdAt: DateTime.now(),
      );
      await _botRepository.createBot(userId, bot);
      final bots = await _botRepository.getBots(userId);
      emit(BotLoaded(bots));
    } catch (e) {
      emit(BotError(e.toString()));
    }
  }

  Future<void> _onBotUpdateRequested(
    BotUpdateRequested event,
    Emitter<BotState> emit,
  ) async {
    emit(BotLoading());
    try {
      final currentBot = (await _botRepository.getBots(userId))
          .firstWhere((b) => b.id == event.botId);
      final updatedBot = Bot(
        id: currentBot.id,
        name: event.name,
        token: currentBot.token,
        description: event.description,
        createdAt: currentBot.createdAt,
      );
      await _botRepository.updateBot(userId, updatedBot);
      final bots = await _botRepository.getBots(userId);
      emit(BotLoaded(bots));
    } catch (e) {
      emit(BotError(e.toString()));
    }
  }

  Future<void> _onBotDeleteRequested(
    BotDeleteRequested event,
    Emitter<BotState> emit,
  ) async {
    emit(BotLoading());
    try {
      await _botRepository.deleteBot(userId, event.botId);
      final bots = await _botRepository.getBots(userId);
      emit(BotLoaded(bots));
    } catch (e) {
      emit(BotError(e.toString()));
    }
  }
}

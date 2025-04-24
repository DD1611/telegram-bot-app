import 'package:equatable/equatable.dart';
import '../../domain/entities/bot.dart';

abstract class BotState extends Equatable {
  const BotState();

  @override
  List<Object?> get props => [];
}

class BotInitial extends BotState {}

class BotLoading extends BotState {}

class BotLoaded extends BotState {
  final List<Bot> bots;

  const BotLoaded(this.bots);

  @override
  List<Object?> get props => [bots];
}

class BotSuccess extends BotState {
  final String message;

  const BotSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class BotError extends BotState {
  final String message;

  const BotError(this.message);

  @override
  List<Object?> get props => [message];
}

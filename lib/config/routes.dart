import 'package:flutter/material.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/bot/presentation/pages/bot_list_page.dart';
import '../features/bot/presentation/pages/bot_create_page.dart';
import '../features/bot/presentation/pages/bot_detail_page.dart';

class Routes {
  static const String login = '/login';
  static const String register = '/register';
  static const String botList = '/bot-list';
  static const String botCreate = '/bot-create';
  static const String botDetail = '/bot-detail';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case Routes.botList:
        return MaterialPageRoute(builder: (_) => const BotListPage());
      case Routes.botCreate:
        return MaterialPageRoute(builder: (_) => const BotCreatePage());
      case Routes.botDetail:
        final botId = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => BotDetailPage(botId: botId));
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}

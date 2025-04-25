import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'config/routes.dart';
import 'config/theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/data/services/auth_service.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/bot/presentation/pages/bot_list_page.dart';
import 'features/bot/presentation/pages/bot_detail_page.dart';
import 'features/bot/data/repositories/bot_repository_impl.dart';
import 'features/bot/presentation/bloc/bot_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase
    await Firebase.initializeApp();
    runApp(const MyApp());
  } catch (e) {
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Error initializing app: $e'),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService(
      auth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
      facebookAuth: FacebookAuth.instance,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            authService: authService,
          ),
        ),
        BlocProvider(
          create: (context) {
            final authState = context.read<AuthBloc>().state;
            final userId = authState is AuthSuccess
                ? authState.user.uid
                : FirebaseAuth.instance.currentUser?.uid ?? 'default_user_id';
            return BotBloc(
              userId: userId,
              botRepository: BotRepositoryImpl(),
            );
          },
        ),
      ],
      child: MaterialApp(
        title: 'Telegram Bot Manager',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const LoginPage(),
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

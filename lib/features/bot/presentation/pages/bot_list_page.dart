import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bot_bloc.dart';
import '../bloc/bot_state.dart';
import '../../../../config/routes.dart';
import '../../../../features/auth/presentation/bloc/auth_bloc.dart';

class BotListPage extends StatefulWidget {
  const BotListPage({super.key});

  @override
  State<BotListPage> createState() => _BotListPageState();
}

class _BotListPageState extends State<BotListPage> {
  @override
  void initState() {
    super.initState();
    _loadBots();
  }

  void _loadBots() {
    if (mounted) {
      context.read<BotBloc>().add(BotLoadRequested());
    }
  }

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthBloc>().add(AuthLogoutRequested());
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bots'),
        leading: const Icon(Icons.smart_toy),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.pushNamed(context, Routes.botCreate);
              // Refresh the bot list when returning from create page
              if (mounted) {
                context.read<BotBloc>().add(BotLoadRequested());
              }
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _handleLogout(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                  (route) => false,
                );
              }
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<BotBloc, BotState>(
            listener: (context, state) {
              if (state is BotError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<BotBloc, BotState>(
          builder: (context, state) {
            if (state is BotLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BotError) {
              return Center(child: Text(state.message));
            } else if (state is BotLoaded) {
              if (state.bots.isEmpty) {
                return const Center(
                  child: Text('No bots found. Create your first bot!'),
                );
              }
              return ListView.builder(
                itemCount: state.bots.length,
                itemBuilder: (context, index) {
                  final bot = state.bots[index];
                  return ListTile(
                    title: Text(bot.name),
                    subtitle: Text(bot.description),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.botDetail,
                        arguments: bot.id,
                      );
                    },
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bot_bloc.dart';
import '../bloc/bot_state.dart';
import '../../../../config/routes.dart';

class BotCreatePage extends StatefulWidget {
  const BotCreatePage({super.key});

  @override
  State<BotCreatePage> createState() => _BotCreatePageState();
}

class _BotCreatePageState extends State<BotCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _tokenController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _tokenController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Bot')),
      body: BlocListener<BotBloc, BotState>(
        listener: (context, state) {
          if (state is BotError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is BotLoaded) {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Bot Name',
                    hintText: 'Enter a name for your bot',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _tokenController,
                  decoration: const InputDecoration(
                    labelText: 'Bot Token',
                    hintText: 'Enter your bot token from @BotFather',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a token';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter a description for your bot',
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<BotBloc>().add(
                        BotCreateRequested(
                          name: _nameController.text,
                          token: _tokenController.text,
                          description: _descriptionController.text,
                        ),
                      );
                    }
                  },
                  child: const Text('Create Bot'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

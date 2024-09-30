import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          'Choose your language:',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        RadioListTile<String>(
          title: const Text('English'),
          value: 'English',
          groupValue: context.watch<AppCubit>().state.userLanguage,
          onChanged: (value) =>
              context.read<AppCubit>().updateUserLanguage(value!),
        ),
        RadioListTile<String>(
          title: const Text('French'),
          value: 'French',
          groupValue: context.watch<AppCubit>().state.userLanguage,
          onChanged: (value) =>
              context.read<AppCubit>().updateUserLanguage(value!),
        ),
      ],
    );
  }
}

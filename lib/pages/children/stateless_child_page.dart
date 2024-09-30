import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:bloc_list_tab_carousel/pages/children/stateful_child_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatelessChildWidget extends StatelessWidget {
  const StatelessChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    toggleLanguage() {
      if (context.read<AppCubit>().state.userLanguage == 'English') {
        context.read<AppCubit>().updateUserLanguage('French');
      } else {
        context.read<AppCubit>().updateUserLanguage('English');
      }
    }

    Widget buildButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: BlocProvider.of<AppCubit>(context),
                child: const StatefulChildWidget(),
              ),
            ),
          ),
          child: const Text('Stateful Child (New Context)'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Stateless Child')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'I am now ${context.watch<AppCubit>().state.userLanguage}',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
              onPressed: () => toggleLanguage(),
              child: const Text('Toggle language'),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Are you premium?',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          context.watch<AppCubit>().state.isPremium
              ? const Icon(Icons.check_circle, size: 64, color: Colors.green)
              : const Icon(Icons.close, size: 64, color: Colors.red),
          const SizedBox(height: 40),
          buildButton(),
        ],
      ),
      // bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}

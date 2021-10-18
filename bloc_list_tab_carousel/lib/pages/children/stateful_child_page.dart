import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatefulChildWidget extends StatefulWidget {
  const StatefulChildWidget({Key key}) : super(key: key);

  @override
  _SecondChildState createState() => _SecondChildState();
}

class _SecondChildState extends State<StatefulChildWidget> {
  @override
  Widget build(BuildContext context) {
    _toggleLanguage() {
      if (context.read<AppCubit>().state.userLanguage == 'English') {
        context.read<AppCubit>().updateUserLanguage('French');
      } else {
        context.read<AppCubit>().updateUserLanguage('English');
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Stateful Child')),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I am now ${context.watch<AppCubit>().state.userLanguage}',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(
                onPressed: () => _toggleLanguage(),
                child: const Text('Toggle language'),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Are you premium?',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            context.watch<AppCubit>().state.isPremium
                ? const Icon(Icons.check_circle, size: 64, color: Colors.green)
                : const Icon(Icons.close, size: 64, color: Colors.red),
          ]),
      // bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}

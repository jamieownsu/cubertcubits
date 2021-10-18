import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  Widget _buildChildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, '/first'),
      child: const Text('Stateless Child (New Context)'),
    );
  }

  Widget _buildPremiumChildButton(BuildContext context) {
    return ElevatedButton(
      style: context.read<AppCubit>().state.isPremium
          ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green))
          : ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey)),
      onPressed: () => context.read<AppCubit>().state.isPremium
          ? Navigator.pushNamed(context, '/second')
          : ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('You no premium!'))),
      child: const Text('Stateful Child (New Context)'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'cubits 4 cubert',
          style: Theme.of(context).textTheme.headline3,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 60),
        Text(
          'I am now ${context.watch<AppCubit>().state.userLanguage}',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 40),
        _buildChildButton(context),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            'Second child only avaible to premium users!',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        _buildPremiumChildButton(context)
      ]),
    );
  }
}

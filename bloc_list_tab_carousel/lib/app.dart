import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:bloc_list_tab_carousel/navigation/bottom_navigation_widget.dart';
import 'package:bloc_list_tab_carousel/pages/home_page.dart';
import 'package:bloc_list_tab_carousel/pages/settings_page.dart';
import 'package:bloc_list_tab_carousel/pages/some_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    context.read<AppCubit>().state.controller.dispose();
    super.dispose();
  }

  Widget _buildPurchaseButton() {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
      onPressed: () => Navigator.pushNamed(context, '/purchase'),
      child: const Text('Buy Premium'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<AppCubit>().state.pageTitle),
        actions: [
          if (!context.watch<AppCubit>().state.isPremium) _buildPurchaseButton()
        ],
      ),
      body: BlocProvider.value(
        value: BlocProvider.of<AppCubit>(context),
        child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: context.read<AppCubit>().state.controller,
            children: const <Widget>[
              HomePage(),
              SomeListPage(),
              SettingsPage(),
            ]),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}

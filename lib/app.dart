import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:bloc_list_tab_carousel/navigation/bottom_navigation_widget.dart';
import 'package:bloc_list_tab_carousel/pages/home_page.dart';
import 'package:bloc_list_tab_carousel/pages/settings_page.dart';
import 'package:bloc_list_tab_carousel/pages/some_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildPurchaseButton() {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red)),
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
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: context.watch<AppCubit>().controller,
          children: const <Widget>[
            HomePage(),
            SomeListPage(),
            SettingsPage(),
          ]),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}

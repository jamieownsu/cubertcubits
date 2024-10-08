import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:bloc_list_tab_carousel/navigation/bottom_navigation_widget.dart';
import 'package:bloc_list_tab_carousel/pages/home_page.dart';
import 'package:bloc_list_tab_carousel/pages/settings_page.dart';
import 'package:bloc_list_tab_carousel/pages/some_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<AppCubit>().state.pageTitle),
        actions: [
          if (!context.watch<AppCubit>().state.isPremium)
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/purchase'),
              child: const Text('Buy Premium'),
            ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: context.watch<AppCubit>().controller,
        children: const <Widget>[
          HomePage(),
          SomeListPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}

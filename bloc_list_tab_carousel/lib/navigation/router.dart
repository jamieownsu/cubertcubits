import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:bloc_list_tab_carousel/pages/children/stateless_child_page.dart';
import 'package:bloc_list_tab_carousel/pages/children/stateful_child_page.dart';
import 'package:bloc_list_tab_carousel/app.dart';
import 'package:bloc_list_tab_carousel/pages/purchase_page.dart';
import 'package:bloc_list_tab_carousel/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
    case '/main':
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: BlocProvider.of<AppCubit>(context),
          child: const App(),
        ),
      );
    case '/settings':
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: BlocProvider.of<AppCubit>(context),
          child: const SettingsPage(),
        ),
      );
    case '/first':
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: BlocProvider.of<AppCubit>(context),
          child: const StatelessChildWidget(),
        ),
      );
    case '/second':
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: BlocProvider.of<AppCubit>(context),
          child: const StatefulChildWidget(),
        ),
      );
    case '/purchase':
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: BlocProvider.of<AppCubit>(context),
          child: const PurchasePage(),
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

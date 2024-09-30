import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:bloc_list_tab_carousel/navigation/router.dart';
import 'package:bloc_list_tab_carousel/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    context.read<AppCubit>().controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Nav Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const App(),
      onGenerateRoute: (settings) => generateRoute(settings, context),
    );
  }
}

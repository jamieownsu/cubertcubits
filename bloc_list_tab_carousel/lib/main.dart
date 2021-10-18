import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:bloc_list_tab_carousel/navigation/router.dart';
import 'package:bloc_list_tab_carousel/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Nav Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: BlocProvider<AppCubit>(
        create: (_) => AppCubit(_controller),
        child: const App(),
      ),
      onGenerateRoute: (settings) => generateRoute(settings, context),
    );
  }
}

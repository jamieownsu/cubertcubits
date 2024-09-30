import 'package:bloc_list_tab_carousel/cubits/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      currentIndex: context.watch<AppCubit>().state.navigationIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (i) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        context.read<AppCubit>().updateNavigationIndex(i);
      },
    );
  }
}

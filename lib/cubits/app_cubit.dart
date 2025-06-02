import 'package:bloc_list_tab_carousel/cubits/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const routes = ['Home', 'List', 'Settings'];

class AppCubit extends Cubit<AppState> {
  final PageController controller = PageController();

  AppCubit() : super(const AppState.initial());

  void updateNavigationIndex(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
    emit(
      AppState.update(
        navigationIndex: index,
        userLanguage: state.userLanguage,
        pageTitle: routes[index],
        isPremium: state.isPremium,
      ),
    );
  }

  void updateUserLanguage(String language) {
    emit(
      AppState.update(
        navigationIndex: state.navigationIndex,
        userLanguage: language,
        pageTitle: state.pageTitle,
        isPremium: state.isPremium,
      ),
    );
  }

  void updateIsPremium(bool isPremium) {
    emit(
      AppState.update(
        navigationIndex: state.navigationIndex,
        userLanguage: state.userLanguage,
        pageTitle: state.pageTitle,
        isPremium: isPremium,
      ),
    );
  }
}

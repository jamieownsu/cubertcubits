import 'package:bloc_list_tab_carousel/cubits/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const routes = ['Home', 'List', 'Settings'];

class AppCubit extends Cubit<AppState> {
  final PageController controller;
  AppCubit(this.controller) : super(AppState.initial(controller));

  updateNavigationIndex(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
    emit(
      AppState.update(
        state.controller,
        index,
        state.userLanguage,
        routes[index],
        state.isPremium,
      ),
    );
  }

  updateUserLanguage(String language) {
    emit(
      AppState.update(
        state.controller,
        state.navigationIndex,
        language,
        state.pageTitle,
        state.isPremium,
      ),
    );
  }

  updateIsPremium(bool isPremium) {
    emit(
      AppState.update(
        state.controller,
        state.navigationIndex,
        state.userLanguage,
        state.pageTitle,
        isPremium,
      ),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppStatus { initial, update }

class AppState extends Equatable {
  const AppState._({
    this.navigationIndex = 0,
    this.userLanguage = 'English',
    this.pageTitle = 'Home',
    this.controller,
    this.isPremium = false,
  });

  const AppState.initial(PageController controller)
      : this._(controller: controller);

  const AppState.update(PageController controller, int index, String language,
      String title, bool premium)
      : this._(
          controller: controller,
          navigationIndex: index,
          userLanguage: language,
          pageTitle: title,
          isPremium: premium,
        );

  final PageController controller;
  final int navigationIndex;
  final String userLanguage, pageTitle;
  final bool isPremium;

  @override
  List<Object> get props =>
      [controller, navigationIndex, userLanguage, pageTitle, isPremium];
}

class AppState {
  final int navigationIndex;
  final String userLanguage, pageTitle;
  final bool isPremium;

  const AppState.initial({
    this.navigationIndex = 0,
    this.userLanguage = 'English',
    this.pageTitle = 'Home',
    this.isPremium = false,
  });

  const AppState.update({
    required this.navigationIndex,
    required this.userLanguage,
    required this.pageTitle,
    required this.isPremium,
  });
}

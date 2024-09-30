
enum AppStatus { initial, update }

class AppState {
  final int navigationIndex;
  final String userLanguage, pageTitle;
  final bool isPremium;

  const AppState._({
    this.navigationIndex = 0,
    this.userLanguage = 'English',
    this.pageTitle = 'Home',
    this.isPremium = false,
  });

  const AppState.initial() : this._();

  const AppState.update(int index, String language, String title, bool premium)
      : this._(
          navigationIndex: index,
          userLanguage: language,
          pageTitle: title,
          isPremium: premium,
        );
}

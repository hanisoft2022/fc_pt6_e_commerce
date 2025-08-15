part of 'bottom_nav_cubit.dart';

enum MyTab { home, category, search, user }

extension TabX on MyTab {
  String get iconPath {
    switch (this) {
      case MyTab.home:
        return AppIcons.navHome;
      case MyTab.category:
        return AppIcons.navCategory;
      case MyTab.search:
        return AppIcons.navSearch;
      case MyTab.user:
        return AppIcons.navUser;
    }
  }

  String get activeIconPath {
    switch (this) {
      case MyTab.home:
        return AppIcons.navHomeOn;
      case MyTab.category:
        return AppIcons.navCategoryOn;
      case MyTab.search:
        return AppIcons.navSearchOn;
      case MyTab.user:
        return AppIcons.navUserOn;
    }
  }

  String get name {
    switch (this) {
      case MyTab.home:
        return '홈';
      case MyTab.category:
        return '카테고리';
      case MyTab.search:
        return '검색';
      case MyTab.user:
        return '마이페이지';
    }
  }
}

final class BottomNavState {
  final MyTab tab;
  BottomNavState({required this.tab});
}

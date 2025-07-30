part of 'bottom_nav_cubit.dart';

enum Tab { home, category, search, user }

extension TabX on Tab {
  String get iconPath {
    switch (this) {
      case Tab.home:
        return AppIcons.navHome;
      case Tab.category:
        return AppIcons.navCategory;
      case Tab.search:
        return AppIcons.navSearch;
      case Tab.user:
        return AppIcons.navUser;
    }
  }

  String get activeIconPath {
    switch (this) {
      case Tab.home:
        return AppIcons.navHomeOn;
      case Tab.category:
        return AppIcons.navCategoryOn;
      case Tab.search:
        return AppIcons.navSearchOn;
      case Tab.user:
        return AppIcons.navUserOn;
    }
  }

  String get name {
    switch (this) {
      case Tab.home:
        return '홈';
      case Tab.category:
        return '카테고리';
      case Tab.search:
        return '검색';
      case Tab.user:
        return '마이페이지';
    }
  }
}

final class BottomNavState {
  final Tab tab;
  BottomNavState({required this.tab});
}

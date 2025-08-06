import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class HomeTabBarView extends StatelessWidget {
  final List<Menu> menus;
  final MallType mallType;

  const HomeTabBarView({super.key, required this.menus, required this.mallType});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: List.generate(
          menus.length,
          (index) =>
              Column(children: [Text('mallType: ${mallType.name}'), Text(menus[index].title)]),
        ),
      ),
    );
  }
}

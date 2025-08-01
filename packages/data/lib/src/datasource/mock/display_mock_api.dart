import 'dart:convert';

import 'package:data/src/datasource/mock/display_mock_data.dart';
import 'package:data/src/datasource/remote/display_api.dart';
import 'package:data/src/dto/menu/menu_dto.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<List<MenuDto>> getMenus(String mallType) {
    return Future(
      () => _menuParser(
        mallType == 'market' ? DisplayMockData.menusByMarket : DisplayMockData.menusByBeauty,
      ),
    );
  }

  List<MenuDto> _menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();

    return menus;
  }
}

import 'dart:convert';

import 'package:data/src/datasource/mock/display_mock_data.dart';
import 'package:data/src/datasource/remote/display_api.dart';
import 'package:data/src/dto/menu/common/response_wrapper.dart';
import 'package:data/src/dto/menu/menu_dto.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenus(String mallType) {
    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: 'display mock api',
        data: _menuParser(
          mallType == 'market' ? DisplayMockData.menusByMarket : DisplayMockData.menusByBeauty,
        ),
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

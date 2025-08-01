import 'dart:convert';

import 'package:display_api/display_api.dart';
import 'package:display_mock_api/display_mock_api.dart';
import 'package:response_wrapper/response_wrapper.dart';

class DisplayMockApi implements DisplayApiClient {
  @override
  Future<ResponseWrapper<List<Menu>>> getMenus(String mallType) {
    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: 'display mock api success',
        data: _menuParser(
          mallType == 'market' ? DisplayMockData.menusByMarket : DisplayMockData.menusByBeauty,
        ),
      ),
    );
  }

  List<Menu> _menuParser(String source) {
    List<Menu> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => Menu.fromJson(e)).toList();

    return menus;
  }
}

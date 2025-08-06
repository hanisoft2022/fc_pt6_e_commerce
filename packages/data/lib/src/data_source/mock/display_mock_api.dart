import 'dart:convert';

import 'package:data/src/data_source/mock/display_mock_data.dart';
import 'package:data/src/data_source/remote/display/display_api.dart';
import 'package:data/src/dto/common/response_wrapper.dart';
import 'package:data/src/dto/menu/menu_dto.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenus(String mallType) {
    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: 'display mock api',
        // status: 'FAILURE',
        // code: 'GNB-0000',
        // message: '서비스 에러가 발생했습니다.',
        data: _menuParser(
          mallType == '마켓패캠' ? DisplayMockData.menusByMarket : DisplayMockData.menusByBeauty,
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

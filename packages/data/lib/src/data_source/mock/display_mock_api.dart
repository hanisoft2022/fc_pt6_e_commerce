import 'dart:convert';

import 'package:data/src/data_source/mock/display_mock_data.dart';
import 'package:data/src/data_source/remote/display/display_api.dart';
import 'package:data/src/dto/common/response_wrapper.dart';
import 'package:data/src/dto/display/menu_dto.dart';
import 'package:data/src/dto/display/view_module_dto.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenus(String mallType) async {
    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: 'display mock api',
      // status: 'FAILURE',
      // code: 'GNB-0000',
      // message: '서비스 에러가 발생했습니다.',
      data: _menuParser(
        mallType == '마켓패캠' ? DisplayMockData.menusByMarket : DisplayMockData.menusByBeauty,
      ),
    );
  }

  @override
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulues(int tabId, int page) async {
    if (page == 4) {
      return ResponseWrapper(status: 'SUCCESS', code: '0000', message: '모듈 더 이상 존재 X', data: []);
    }
    final endOfTabId = tabId % 10;

    final String source = switch (endOfTabId) {
      1 => DisplayMockData.viewModulesByTabIdCaseOne,
      2 => DisplayMockData.viewModulesByTabIdCaseTwo,
      3 => DisplayMockData.viewModulesByTabIdCaseThree,
      4 => DisplayMockData.viewModulesByTabIdCaseFour,
      5 => DisplayMockData.viewModulesByTabIdCaseFive,
      _ => throw ArgumentError('지원하지 않는 tabId: $tabId'),
    };

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: 'display mock api',
      data: _viewModuleParser(source),
    );
  }

  List<MenuDto> _menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();
    return menus;
  }

  List<ViewModuleDto> _viewModuleParser(String source) {
    List<ViewModuleDto> viewModules = [];
    final List json = jsonDecode(source);
    viewModules = json.map((e) => ViewModuleDto.fromJson(e)).toList();
    return viewModules;
  }
}

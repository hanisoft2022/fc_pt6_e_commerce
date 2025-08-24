import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'display_api.g.dart';

@singleton
@RestApi()
abstract interface class DisplayApi {
  factory DisplayApi(Dio dio, {String baseUrl}) = _DisplayApi;

  @GET('/api/menus/{mall_type}')
  Future<ResponseWrapper<List<MenuDto>>> getMenus(@Path('mall_type') String mallType);

  @GET('/api/view-modules/{tab_id}')
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulues(
    @Path('tab_id') int tabId,
    @Query('page') int page,
  );
}

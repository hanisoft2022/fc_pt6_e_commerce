import 'package:data/src/dto/common/response_wrapper.dart';
import 'package:data/src/dto/menu/menu_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'display_api.g.dart';

@RestApi()
abstract interface class DisplayApi {
  factory DisplayApi(Dio dio, {String baseUrl}) = _DisplayApi;

  @GET('/api/menus/{mall_type}')
  Future<ResponseWrapper<List<MenuDto>>> getMenus(@Path('mall_type') String mallType);
}

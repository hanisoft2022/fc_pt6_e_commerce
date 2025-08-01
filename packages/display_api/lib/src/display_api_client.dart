import 'package:dio/dio.dart';
import 'package:response_wrapper/response_wrapper.dart';
import 'package:retrofit/retrofit.dart';

import 'models/menu.dart';

part 'display_api_client.g.dart';

@RestApi()
abstract class DisplayApiClient {
  factory DisplayApiClient(Dio dio, {String? baseUrl}) = _DisplayApiClient;

  @GET('/api/menus/{mall_type}')
  Future<ResponseWrapper<List<Menu>>> getMenus(@Path('mall_type') String mallType);
}

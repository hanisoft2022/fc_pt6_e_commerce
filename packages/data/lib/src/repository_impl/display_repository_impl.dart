import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _displayApi;

  DisplayRepositoryImpl({required DisplayApi displayApi}) : _displayApi = displayApi;

  @override
  Future<ResponseWrapper<List<MenuEntity>>> getMenus({required MallType mallType}) async {
    final ResponseWrapper<List<MenuDto>> response = await _displayApi.getMenus(mallType.name);

    return response.toEntity<List<MenuEntity>>(
      response.data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }

  @override
  Future<ApiResponse<List<ViewModuleEntity>>> getViewModules({
    required int tabId,
    required int page,
  }) async {
    final ResponseWrapper<List<ViewModuleDto>> response = await _displayApi.getViewModulues(
      tabId,
      page,
    );

    return response.toEntity<List<ViewModuleEntity>>(
      response.data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }

  @override
  Future<ApiResponse<List<CartEntity>>> addCart(CartEntity cart) {
    // TODO: implement addCart
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<CartEntity>>> changeCartQty(String productId, int quantity) {
    // TODO: implement changeCartQty
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<CartEntity>>> clearCart() {
    // TODO: implement clearCart
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<CartEntity>>> deleteCart(List<String> productIds) {
    // TODO: implement deleteCart
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<CartEntity>>> getCartList() {
    // TODO: implement getCartList
    throw UnimplementedError();
  }
}

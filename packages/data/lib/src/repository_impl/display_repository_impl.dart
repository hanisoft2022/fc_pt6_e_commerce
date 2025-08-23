import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _displayApi;
  final DisplayDao _displayDao;

  DisplayRepositoryImpl({required DisplayApi displayApi, required DisplayDao displayDao})
    : _displayApi = displayApi,
      _displayDao = displayDao;

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
  Future<ApiResponse<List<CartEntity>>> addtoCart(CartEntity cart) async {
    final response = await _displayDao.addtoCart(cart.toRemoteModel());

    return response.toEntity<List<CartEntity>>(
      response.data?.map((cartModel) => cartModel.toEntity()).toList() ?? [],
    );
  }

  @override
  Future<ApiResponse<List<CartEntity>>> getCartList() async {
    final response = await _displayDao.getCartList();

    return response.toEntity<List<CartEntity>>(
      response.data?.map((cartModel) => cartModel.toEntity()).toList() ?? [],
    );
  }

  @override
  Future<ApiResponse<List<CartEntity>>> changeCartItemQty(String productId, int quantity) async {
    final response = await _displayDao.changeCartItemQty(productId, quantity);

    return response.toEntity<List<CartEntity>>(
      response.data?.map((cartModel) => cartModel.toEntity()).toList() ?? [],
    );
  }

  @override
  Future<ApiResponse<List<CartEntity>>> deleteCartItem(List<String> productIds) async {
    final response = await _displayDao.deleteCartItem(productIds);

    return response.toEntity<List<CartEntity>>(
      response.data?.map((cartModel) => cartModel.toEntity()).toList() ?? [],
    );
  }

  @override
  Future<ApiResponse<List<CartEntity>>> clearCart() async {
    final response = await _displayDao.clearCart();

    return response.toEntity<List<CartEntity>>(
      response.data?.map((cartModel) => cartModel.toEntity()).toList() ?? [],
    );
  }
}

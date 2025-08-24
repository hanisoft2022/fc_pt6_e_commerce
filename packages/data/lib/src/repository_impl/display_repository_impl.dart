import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayDao _displayDao;

  DisplayRepositoryImpl({required DisplayDao displayDao}) : _displayDao = displayDao;

  @override
  Future<ResponseWrapper<List<MenuEntity>>> getMenus({required MallType mallType}) async {
    return await _displayDao.getMenus(mallType: mallType);
  }

  @override
  Future<ApiResponse<List<ViewModuleEntity>>> getViewModules({
    required int tabId,
    required int page,
  }) async {
    return await _displayDao.getViewModules(tabId: tabId, page: page);
  }

  @override
  Future<ApiResponse<List<CartEntity>>> addToCart(CartEntity cart) async {
    return await _displayDao.addToCart(cart);
  }

  @override
  Future<ApiResponse<List<CartEntity>>> getCartList() async {
    return await _displayDao.getCartList();
  }

  @override
  Future<ApiResponse<List<CartEntity>>> changeCartProductQty(String productId, int quantity) async {
    return await _displayDao.changeCartProductQty(productId, quantity);
  }

  @override
  Future<ApiResponse<List<CartEntity>>> deleteCartProduct(List<String> productIds) async {
    return await _displayDao.deleteCartProduct(productIds);
  }

  @override
  Future<ApiResponse<List<CartEntity>>> clearCart() async {
    return await _displayDao.clearCart();
  }
}

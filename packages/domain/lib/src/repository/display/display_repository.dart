import 'package:core/core.dart';
import 'package:domain/domain.dart';

abstract interface class DisplayRepository implements Repository {
  Future<ApiResponse<List<MenuEntity>>> getMenus({required MallType mallType});
  Future<ApiResponse<List<ViewModuleEntity>>> getViewModules({
    required int tabId,
    required int page,
  });

  /// 장바구니 담기
  Future<ApiResponse<List<CartEntity>>> addtoCart(CartEntity cart);

  /// 장바구니 리스트 불러오기
  Future<ApiResponse<List<CartEntity>>> getCartList();

  /// 장바구니 상품 수량 변경
  Future<ApiResponse<List<CartEntity>>> changeCartItemQty(String productId, int quantity);

  /// 장바구니에 담긴 상품 삭제 by productId
  Future<ApiResponse<List<CartEntity>>> deleteCartItem(List<String> productIds);

  /// 장바구니 상품 전체 삭제
  Future<ApiResponse<List<CartEntity>>> clearCart();
}

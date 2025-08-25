part of 'cart_list_bloc.dart';

sealed class CartListEvent {
  const CartListEvent();
}

class CartListStarted extends CartListEvent {
  CartListStarted();
}

class CartProductAdded extends CartListEvent {
  final ProductInfoEntity productInfo;
  final int quantity;

  CartProductAdded({required this.productInfo, required this.quantity});
}

class CartListGetList extends CartListEvent {
  CartListGetList();
}

class CartProductSelected extends CartListEvent {
  final CartEntity cartEntity;

  CartProductSelected({required this.cartEntity});
}

class CartAllProductsSelected extends CartListEvent {
  CartAllProductsSelected();
}

class CartProductQtyDecreased extends CartListEvent {
  final CartEntity cartEntity;

  CartProductQtyDecreased({required this.cartEntity});
}

class CartProductQtyIncreased extends CartListEvent {
  final CartEntity cartEntity;

  CartProductQtyIncreased({required this.cartEntity});
}

class CartProductDeleted extends CartListEvent {
  final List<String> productIds;

  CartProductDeleted({required this.productIds});
}

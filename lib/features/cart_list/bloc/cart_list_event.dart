part of 'cart_list_bloc.dart';

sealed class CartListEvent {
  const CartListEvent();
}

class CartListStarted extends CartListEvent {
  CartListStarted();
}

class CartListAdded extends CartListEvent {
  final ProductInfoEntity productInfo;
  final int quantity;

  CartListAdded({required this.productInfo, required this.quantity});
}

class CartListGetList extends CartListEvent {
  CartListGetList();
}

class CartListSelected extends CartListEvent {
  final CartEntity cart;

  CartListSelected({required this.cart});
}

class CartListSelectedAll extends CartListEvent {
  CartListSelectedAll();
}

class CartListQtyDecreased extends CartListEvent {
  final CartEntity cart;

  CartListQtyDecreased({required this.cart});
}

class CartListQtyIncreased extends CartListEvent {
  final CartEntity cart;

  CartListQtyIncreased({required this.cart});
}

class CartListDeleted extends CartListEvent {
  final List<String> productIds;

  CartListDeleted({required this.productIds});
}

part of 'cart_list_bloc.dart';

abstract class CartListEvent {
  const CartListEvent();
}

class CartListInitialized extends CartListEvent {
  CartListInitialized();
}

class CartListGetList extends CartListEvent {
  CartListGetList();
}

class CartListAdded extends CartListEvent {
  final int quantity;
  final ProductInfoEntity productInfo;

  CartListAdded({required this.quantity, required this.productInfo});
}

class CartListSelectedAll extends CartListEvent {
  CartListSelectedAll();
}

class CartListSelected extends CartListEvent {
  final CartEntity cart;

  CartListSelected({required this.cart});
}

class CartListDeleted extends CartListEvent {
  final List<String> productIds;

  CartListDeleted({required this.productIds});
}

class CartListQtyDecreased extends CartListEvent {
  final CartEntity cart;

  CartListQtyDecreased({required this.cart});
}

class CartListQtyIncreased extends CartListEvent {
  final CartEntity cart;

  CartListQtyIncreased({required this.cart});
}

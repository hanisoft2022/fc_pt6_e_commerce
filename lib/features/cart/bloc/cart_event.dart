part of 'cart_bloc.dart';

sealed class CartEvent {
  const CartEvent();
}

class CartStarted extends CartEvent {
  const CartStarted();
}

class CartOpend extends CartEvent {
  final ProductInfo productInfo;
  final int quantity;

  const CartOpend({required this.productInfo, required this.quantity});
}

class CartClosed extends CartEvent {
  const CartClosed();
}

class CartQuantityDecreased extends CartEvent {}

class CartQuantityIncreased extends CartEvent {
  const CartQuantityIncreased();
}

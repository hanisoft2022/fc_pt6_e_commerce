part of 'cart_bloc.dart';

sealed class CartEvent {
  const CartEvent();
}

class CartStarted extends CartEvent {
  const CartStarted();
}

class CartClosed extends CartEvent {
  const CartClosed();
}

class CardOpend extends CartEvent {
  final ProductInfo productInfo;
  final int quantity;

  const CardOpend({required this.productInfo, required this.quantity});
}

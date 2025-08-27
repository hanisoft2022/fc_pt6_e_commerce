part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class PaymentRequested extends PaymentEvent {
  final List<CartEntity> cartProducts;
  final BuildContext context;

  PaymentRequested({required this.cartProducts, required this.context});
}

part of 'cart_list_bloc.dart';

@freezed
abstract class CartListState with _$CartListState {
  factory CartListState({
    @Default(Status.initial) Status status,
    @Default(ErrorResponse()) ErrorResponse error,
    @Default(<CartEntity>[]) List<CartEntity> cartList,
    @Default(<String>[]) List<String> selectedProduct,
    @Default(0) int totalPrice,
  }) = _CartListState;
}

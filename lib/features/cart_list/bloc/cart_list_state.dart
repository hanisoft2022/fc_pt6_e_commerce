part of 'cart_list_bloc.dart';

@freezed
abstract class CartListState with _$CartListState {
  factory CartListState({
    @Default(Status.initial) Status status,
    @Default(<CartEntity>[]) List<CartEntity> cartList,
    @Default(<String>[]) List<String> selectedProduct,
    @Default(0) int totalPrice,
    @Default(ErrorResponse()) ErrorResponse error,
  }) = _CartListState;
}

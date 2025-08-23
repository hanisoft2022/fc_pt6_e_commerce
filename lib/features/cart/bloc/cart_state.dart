part of 'cart_bloc.dart';

enum CartStatus { open, close, error }

extension CartStatusX on CartStatus {
  bool get isClose => this == CartStatus.close;
  bool get isOpen => this == CartStatus.open;
  bool get isError => this == CartStatus.error;
}

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(CartStatus.close) CartStatus status,
    @Default(ErrorResponse()) ErrorResponse error,
    @Default(
      ProductInfoEntity(
        productId: '',
        title: '',
        subtitle: '',
        imageUrl: '',
        price: -1,
        originalPrice: -1,
        discountRate: -1,
        reviewCount: -1,
      ),
    )
    ProductInfoEntity productInfo,
    @Default(1) int quantity,
    @Default(0) int totalPrice,
  }) = _CartState;
}

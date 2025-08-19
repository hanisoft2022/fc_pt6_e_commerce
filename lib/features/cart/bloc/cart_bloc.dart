import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/exception/common_exception.dart';
import 'package:e_commerce_app/core/logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<CartStarted>(_onCartStarted);
    on<CartOpend>(_onCartOpened);
    on<CartClosed>(_onCartClosed);
  }

  void _onCartStarted(CartStarted event, Emitter<CartState> emit) {}

  void _onCartOpened(CartOpend event, Emitter<CartState> emit) {
    if (state.status.isOpen) return;

    final productInfo = event.productInfo;
    final quantity = event.quantity;
    final totalPrice = productInfo.price * quantity;

    try {
      emit(
        state.copyWith(
          status: CartStatus.open,
          productInfo: productInfo,
          quantity: quantity,
          totalPrice: totalPrice,
        ),
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: CartStatus.error, error: CommonException.setError(error)));
    }
  }

  void _onCartClosed(CartClosed event, Emitter<CartState> emit) {
    if (state.status.isClose) return;
    try {
      emit(state.copyWith(status: CartStatus.close));
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: CartStatus.error, error: CommonException.setError(error)));
    }
  }
}

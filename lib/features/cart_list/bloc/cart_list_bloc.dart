import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';

part 'cart_list_event.dart';

part 'cart_list_state.dart';

part 'cart_list_bloc.freezed.dart';

@injectable
class CartListBloc extends Bloc<CartListEvent, CartListState> {
  final DisplayUsecase _displayUsecase;

  CartListBloc(this._displayUsecase) : super(CartListState()) {
    on<CartListStarted>(_onCartListStarted);
    on<CartProductAdded>(_onCartProductAdded);
    on<CartProductSelected>(_onCartProductSelected);
    on<CartAllProductsSelected>(_onCartAllProductsSelected);
    on<CartProductQtyDecreased>(_onCartProductQtyDecreased);
    on<CartProductQtyIncreased>(_onCartProductQtyIncreased);
    on<CartProductDeleted>(_onCartProductDeleted);
  }

  Future<void> _onCartListStarted(CartListStarted event, Emitter<CartListState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await _displayUsecase.execute<Result<List<CartEntity>>>(
        usecase: GetCartListUsecase(),
      );
      response.when(
        success: (data) {
          final List<CartEntity> cartProducts = [...data];
          final List<String> selectedProductsIds = cartProducts
              .map((e) => e.productInfo.productId)
              .toList();

          final totalPrice = _calculateTotalPrice(selectedProductsIds, cartProducts);
          // ignore: avoid_print
          print('[test] totalPrice: $totalPrice');
          emit(
            state.copyWith(
              status: Status.success,
              cartProducts: cartProducts,
              totalPrice: totalPrice,
              selectedProductsIds: selectedProductsIds,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.failure, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  Future<void> _onCartProductAdded(CartProductAdded event, Emitter<CartListState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final cartProduct = CartEntity(productInfo: event.productInfo, quantity: event.quantity);

      final Result<List<CartEntity>> response = await _displayUsecase.execute(
        usecase: AddToCartUsecase(cartEntity: cartProduct),
      );

      response.when(
        success: (cartProducts) {
          final selectedProductsIds = [...state.selectedProductsIds];
          final productId = event.productInfo.productId;
          if (selectedProductsIds.indexWhere((e) => e == productId) == -1) {
            selectedProductsIds.add(productId);
          }
          final totalPrice = _calculateTotalPrice(selectedProductsIds, cartProducts);
          emit(
            state.copyWith(
              status: Status.success,
              cartProducts: cartProducts,
              selectedProductsIds: selectedProductsIds,
              totalPrice: totalPrice,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.failure, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  // void _onCartSelected(CartListSelected event, Emitter<CartListState> emit) {
  //   try {
  //     final String productId = event.cart.productInfo.productId;
  //     final selectedProducts = [...state.selectedProductsIds];
  //     final int selectedIdx = state.selectedProductsIds.indexWhere(
  //       (element) => element == productId,
  //     );

  //     if (selectedIdx == -1) {
  //       selectedProducts.add(productId);
  //     } else {
  //       selectedProducts.removeAt(selectedIdx);
  //     }

  //     final totalPrice = _calculateTotalPrice(selectedProducts, state.cartProducts);

  //     emit(state.copyWith(selectedProductsIds: selectedProducts, totalPrice: totalPrice));
  //   } catch (error) {
  //     CustomLogger.logger.e(error.toString());

  //     emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
  //   }
  // }

  void _onCartProductSelected(CartProductSelected event, Emitter<CartListState> emit) {
    try {
      final String productId = event.cartEntity.productInfo.productId;
      final selectedProducts = [...state.selectedProductsIds];

      if (selectedProducts.contains(productId)) {
        selectedProducts.remove(productId);
      } else {
        selectedProducts.add(productId);
      }

      final totalPrice = _calculateTotalPrice(selectedProducts, state.cartProducts);

      emit(state.copyWith(selectedProductsIds: selectedProducts, totalPrice: totalPrice));
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  void _onCartAllProductsSelected(CartAllProductsSelected event, Emitter<CartListState> emit) {
    try {
      // 이미 전체 선택이 되어있는 경우 -> 모두 지움
      if (state.selectedProductsIds.length == state.cartProducts.length) {
        emit(state.copyWith(selectedProductsIds: [], totalPrice: 0));
        return;
      }

      final List<String> selectedProductIds = state.cartProducts
          .map((cartProduct) => cartProduct.productInfo.productId)
          .toList();

      final totalPrice = _calculateTotalPrice(selectedProductIds, state.cartProducts);

      emit(state.copyWith(selectedProductsIds: selectedProductIds, totalPrice: totalPrice));
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  Future<void> _onCartProductQtyDecreased(
    CartProductQtyDecreased event,
    Emitter<CartListState> emit,
  ) async {
    try {
      final productId = event.cartEntity.productInfo.productId;
      final decreasedQuantity = event.cartEntity.quantity - 1;

      if (decreasedQuantity < 1) return;

      final Result<List<CartEntity>> response = await _displayUsecase.execute(
        usecase: ChangeCartProductQtyUsecase(
          productId: productId,
          changedQuantity: decreasedQuantity,
        ),
      );
      response.when(
        success: (cartProducts) {
          final totalPrice = _calculateTotalPrice(state.selectedProductsIds, cartProducts);
          emit(state.copyWith(totalPrice: totalPrice, cartProducts: cartProducts));
        },
        failure: (error) {
          emit(state.copyWith(status: Status.failure, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  Future<void> _onCartProductQtyIncreased(
    CartProductQtyIncreased event,
    Emitter<CartListState> emit,
  ) async {
    try {
      final productId = event.cartEntity.productInfo.productId;
      final increasedQuantity = event.cartEntity.quantity + 1;

      final Result<List<CartEntity>> response = await _displayUsecase.execute(
        usecase: ChangeCartProductQtyUsecase(
          productId: productId,
          changedQuantity: increasedQuantity,
        ),
      );

      response.when(
        success: (cartProducts) {
          final totalPrice = _calculateTotalPrice(state.selectedProductsIds, cartProducts);
          emit(state.copyWith(totalPrice: totalPrice, cartProducts: cartProducts));
        },
        failure: (error) {
          emit(state.copyWith(status: Status.failure, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  Future<void> _onCartProductDeleted(CartProductDeleted event, Emitter<CartListState> emit) async {
    try {
      final Result<List<CartEntity>> response = await _displayUsecase.execute(
        usecase: DeleteCartProductUsecase(productIds: event.productIds),
      );

      response.when(
        success: (data) {
          final List<CartEntity> cartProducts = [...data];
          final selectedProducts = cartProducts.map((e) => e.productInfo.productId).toList();
          final totalPrice = _calculateTotalPrice(selectedProducts, cartProducts);
          emit(
            state.copyWith(
              cartProducts: cartProducts,
              selectedProductsIds: selectedProducts,
              totalPrice: totalPrice,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.failure, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  int _calculateTotalPrice(List<String> selectedProductsIds, List<CartEntity> cartProducts) {
    final Map<String, CartEntity> cartProductsMap = {
      for (var cartProduct in cartProducts) cartProduct.productInfo.productId: cartProduct,
    };

    int totalPrice = 0;

    for (var productId in selectedProductsIds) {
      final cartProduct = cartProductsMap[productId];
      if (cartProduct != null) {
        totalPrice += cartProduct.quantity * cartProduct.productInfo.price;
      }
    }

    return totalPrice;
  }
}

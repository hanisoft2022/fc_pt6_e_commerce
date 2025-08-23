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
    on<CartListInitialized>(_onCartListInitialized);
    on<CartListAdded>(_onCartListAdded);
    on<CartListSelected>(_onCartSelected);
    // on<CartListSelectedAll>(_onCartSelectedAll);
    on<CartListDeleted>(_onCartDeleted);
    on<CartListQtyDecreased>(_onCartQtyDecreased);
    on<CartListQtyIncreased>(_onCartQtyIncreased);
  }

  Future<void> _onCartListInitialized(
    CartListInitialized event,
    Emitter<CartListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await _displayUsecase.execute(usecase: GetCartListUsecase());
      response.when(
        success: (data) {
          final List<CartEntity> cartList = [...data];
          final List<String> selectedProducts = cartList
              .map((e) => e.productInfo.productId)
              .toList();

          final totalPrice = _calTotalPrice(selectedProducts, cartList);
          emit(
            state.copyWith(
              status: Status.success,
              cartList: cartList,
              totalPrice: totalPrice,
              selectedProduct: selectedProducts,
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

  Future<void> _onCartListAdded(CartListAdded event, Emitter<CartListState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final cart = CartEntity(quantity: event.quantity, productInfo: event.productInfo);
    try {
      final response = await _displayUsecase.execute(usecase: AddToCartUsecase(cartEntity: cart));

      response.when(
        success: (cartList) {
          final selectedProducts = [...state.selectedProduct];
          final productId = event.productInfo.productId;
          if (selectedProducts.indexWhere((e) => e == productId) == -1) {
            selectedProducts.add(productId);
          }
          final totalPrice = _calTotalPrice(selectedProducts, cartList);
          emit(
            state.copyWith(
              status: Status.success,
              cartList: cartList,
              selectedProduct: selectedProducts,
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

  Future<void> _onCartDeleted(CartListDeleted event, Emitter<CartListState> emit) async {
    try {
      final response = await _displayUsecase.execute(
        usecase: DeleteCartProductUsecase(productIds: event.productIds),
      );

      response.when(
        success: (data) {
          final List<CartEntity> cartList = [...data];
          final selectedProducts = cartList.map((e) => e.productInfo.productId).toList();
          final totalPrice = _calTotalPrice(selectedProducts, cartList);
          emit(
            state.copyWith(
              cartList: cartList,
              selectedProduct: selectedProducts,
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

  void _onCartSelected(CartListSelected event, Emitter<CartListState> emit) {
    try {
      final String productId = event.cart.productInfo.productId;
      final selectedProducts = [...state.selectedProduct];
      final int selectedIdx = state.selectedProduct.indexWhere((element) => element == productId);
      if (selectedIdx == -1) {
        selectedProducts.add(productId);
      } else {
        selectedProducts.removeAt(selectedIdx);
      }

      final totalPrice = _calTotalPrice(selectedProducts, state.cartList);

      emit(state.copyWith(selectedProduct: selectedProducts, totalPrice: totalPrice));
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  // void _onCartSelectedAll(CartListSelectedAll event, Emitter<CartListState> emit) {
  //   try {
  //     // 이미 전체 선택이 되어있는 경우 -> 모두 지움
  //     if (state.selectedProduct.length == state.cartList.length) {
  //       emit(state.copyWith(selectedProduct: [], totalPrice: 0));

  //       return;
  //     }

  //     final selectedProducts = state.cartList.map((e) => e.productInfo.productId).toList();
  //     final totalPrice = _calTotalPrice(selectedProducts, state.cartList);

  //     emit(state.copyWith(selectedProduct: selectedProducts, totalPrice: totalPrice));
  //   } catch (error) {
  //     CustomLogger.logger.e('${error.toString()}');
  //     emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
  //   }
  // }

  Future<void> _onCartQtyIncreased(CartListQtyIncreased event, Emitter<CartListState> emit) async {
    try {
      final productId = event.cart.productInfo.productId;
      final qty = event.cart.quantity + 1;
      final response = await _displayUsecase.execute(
        usecase: ChangeCartProductQtyUsecase(productId: productId, quantity: qty),
      );

      response.when(
        success: (data) {
          final List<CartEntity> cartList = [...data];

          final totalPrice = _calTotalPrice(state.selectedProduct, cartList);
          emit(state.copyWith(cartList: cartList, totalPrice: totalPrice));
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

  Future<void> _onCartQtyDecreased(CartListQtyDecreased event, Emitter<CartListState> emit) async {
    try {
      final productId = event.cart.productInfo.productId;
      final qty = event.cart.quantity - 1;
      if (qty < 1) return;
      final response = await _displayUsecase.execute(
        usecase: ChangeCartProductQtyUsecase(productId: productId, quantity: qty),
      );
      response.when(
        success: (data) {
          final List<CartEntity> cartList = [...data];

          final totalPrice = _calTotalPrice(state.selectedProduct, cartList);
          emit(state.copyWith(cartList: cartList, totalPrice: totalPrice));
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

  int _calTotalPrice(List<String> selectedIds, List<CartEntity> carts) {
    int price = 0;
    for (final id in selectedIds) {
      for (final cart in carts) {
        if (cart.productInfo.productId == id) {
          price += cart.quantity * cart.productInfo.price;
        }
      }
    }

    return price;
  }
}

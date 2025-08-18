import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(_Initial()) {
    on<CartStarted>(_onCartStarted);
    on<CardOpend>(_onCardOpend);
    on<CartClosed>(_onCartClosed);
  }

  _onCartStarted(CartStarted event, Emitter<CartState> emit) {}
  _onCardOpend(CardOpend event, Emitter<CartState> emit) {}
  _onCartClosed(CartClosed event, Emitter<CartState> emit) {}
}

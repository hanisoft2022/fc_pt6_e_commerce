// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartListState {

 Status get status; List<CartEntity> get cartProducts; List<String> get selectedProductsIds; int get totalPrice; ErrorResponse get error;
/// Create a copy of CartListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartListStateCopyWith<CartListState> get copyWith => _$CartListStateCopyWithImpl<CartListState>(this as CartListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.cartProducts, cartProducts)&&const DeepCollectionEquality().equals(other.selectedProductsIds, selectedProductsIds)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(cartProducts),const DeepCollectionEquality().hash(selectedProductsIds),totalPrice,error);

@override
String toString() {
  return 'CartListState(status: $status, cartProducts: $cartProducts, selectedProductsIds: $selectedProductsIds, totalPrice: $totalPrice, error: $error)';
}


}

/// @nodoc
abstract mixin class $CartListStateCopyWith<$Res>  {
  factory $CartListStateCopyWith(CartListState value, $Res Function(CartListState) _then) = _$CartListStateCopyWithImpl;
@useResult
$Res call({
 Status status, List<CartEntity> cartProducts, List<String> selectedProductsIds, int totalPrice, ErrorResponse error
});




}
/// @nodoc
class _$CartListStateCopyWithImpl<$Res>
    implements $CartListStateCopyWith<$Res> {
  _$CartListStateCopyWithImpl(this._self, this._then);

  final CartListState _self;
  final $Res Function(CartListState) _then;

/// Create a copy of CartListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? cartProducts = null,Object? selectedProductsIds = null,Object? totalPrice = null,Object? error = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,cartProducts: null == cartProducts ? _self.cartProducts : cartProducts // ignore: cast_nullable_to_non_nullable
as List<CartEntity>,selectedProductsIds: null == selectedProductsIds ? _self.selectedProductsIds : selectedProductsIds // ignore: cast_nullable_to_non_nullable
as List<String>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorResponse,
  ));
}

}


/// Adds pattern-matching-related methods to [CartListState].
extension CartListStatePatterns on CartListState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartListState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartListState value)  $default,){
final _that = this;
switch (_that) {
case _CartListState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartListState value)?  $default,){
final _that = this;
switch (_that) {
case _CartListState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status status,  List<CartEntity> cartProducts,  List<String> selectedProductsIds,  int totalPrice,  ErrorResponse error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartListState() when $default != null:
return $default(_that.status,_that.cartProducts,_that.selectedProductsIds,_that.totalPrice,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status status,  List<CartEntity> cartProducts,  List<String> selectedProductsIds,  int totalPrice,  ErrorResponse error)  $default,) {final _that = this;
switch (_that) {
case _CartListState():
return $default(_that.status,_that.cartProducts,_that.selectedProductsIds,_that.totalPrice,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status status,  List<CartEntity> cartProducts,  List<String> selectedProductsIds,  int totalPrice,  ErrorResponse error)?  $default,) {final _that = this;
switch (_that) {
case _CartListState() when $default != null:
return $default(_that.status,_that.cartProducts,_that.selectedProductsIds,_that.totalPrice,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CartListState implements CartListState {
   _CartListState({this.status = Status.initial, final  List<CartEntity> cartProducts = const <CartEntity>[], final  List<String> selectedProductsIds = const <String>[], this.totalPrice = 0, this.error = const ErrorResponse()}): _cartProducts = cartProducts,_selectedProductsIds = selectedProductsIds;
  

@override@JsonKey() final  Status status;
 final  List<CartEntity> _cartProducts;
@override@JsonKey() List<CartEntity> get cartProducts {
  if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartProducts);
}

 final  List<String> _selectedProductsIds;
@override@JsonKey() List<String> get selectedProductsIds {
  if (_selectedProductsIds is EqualUnmodifiableListView) return _selectedProductsIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedProductsIds);
}

@override@JsonKey() final  int totalPrice;
@override@JsonKey() final  ErrorResponse error;

/// Create a copy of CartListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartListStateCopyWith<_CartListState> get copyWith => __$CartListStateCopyWithImpl<_CartListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._cartProducts, _cartProducts)&&const DeepCollectionEquality().equals(other._selectedProductsIds, _selectedProductsIds)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_cartProducts),const DeepCollectionEquality().hash(_selectedProductsIds),totalPrice,error);

@override
String toString() {
  return 'CartListState(status: $status, cartProducts: $cartProducts, selectedProductsIds: $selectedProductsIds, totalPrice: $totalPrice, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CartListStateCopyWith<$Res> implements $CartListStateCopyWith<$Res> {
  factory _$CartListStateCopyWith(_CartListState value, $Res Function(_CartListState) _then) = __$CartListStateCopyWithImpl;
@override @useResult
$Res call({
 Status status, List<CartEntity> cartProducts, List<String> selectedProductsIds, int totalPrice, ErrorResponse error
});




}
/// @nodoc
class __$CartListStateCopyWithImpl<$Res>
    implements _$CartListStateCopyWith<$Res> {
  __$CartListStateCopyWithImpl(this._self, this._then);

  final _CartListState _self;
  final $Res Function(_CartListState) _then;

/// Create a copy of CartListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? cartProducts = null,Object? selectedProductsIds = null,Object? totalPrice = null,Object? error = null,}) {
  return _then(_CartListState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,cartProducts: null == cartProducts ? _self._cartProducts : cartProducts // ignore: cast_nullable_to_non_nullable
as List<CartEntity>,selectedProductsIds: null == selectedProductsIds ? _self._selectedProductsIds : selectedProductsIds // ignore: cast_nullable_to_non_nullable
as List<String>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorResponse,
  ));
}


}

// dart format on

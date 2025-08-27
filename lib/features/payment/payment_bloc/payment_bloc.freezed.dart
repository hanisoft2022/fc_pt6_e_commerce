// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentState {

 PaymentStatus get status; List<String>? get productIds; String? get message;
/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentStateCopyWith<PaymentState> get copyWith => _$PaymentStateCopyWithImpl<PaymentState>(this as PaymentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.productIds, productIds)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(productIds),message);

@override
String toString() {
  return 'PaymentState(status: $status, productIds: $productIds, message: $message)';
}


}

/// @nodoc
abstract mixin class $PaymentStateCopyWith<$Res>  {
  factory $PaymentStateCopyWith(PaymentState value, $Res Function(PaymentState) _then) = _$PaymentStateCopyWithImpl;
@useResult
$Res call({
 PaymentStatus status, List<String>? productIds, String? message
});




}
/// @nodoc
class _$PaymentStateCopyWithImpl<$Res>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._self, this._then);

  final PaymentState _self;
  final $Res Function(PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? productIds = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,productIds: freezed == productIds ? _self.productIds : productIds // ignore: cast_nullable_to_non_nullable
as List<String>?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentState].
extension PaymentStatePatterns on PaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentStatus status,  List<String>? productIds,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.status,_that.productIds,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentStatus status,  List<String>? productIds,  String? message)  $default,) {final _that = this;
switch (_that) {
case _PaymentState():
return $default(_that.status,_that.productIds,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentStatus status,  List<String>? productIds,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.status,_that.productIds,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentState implements PaymentState {
   _PaymentState({this.status = PaymentStatus.initial, final  List<String>? productIds, this.message}): _productIds = productIds;
  

@override@JsonKey() final  PaymentStatus status;
 final  List<String>? _productIds;
@override List<String>? get productIds {
  final value = _productIds;
  if (value == null) return null;
  if (_productIds is EqualUnmodifiableListView) return _productIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? message;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentStateCopyWith<_PaymentState> get copyWith => __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._productIds, _productIds)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_productIds),message);

@override
String toString() {
  return 'PaymentState(status: $status, productIds: $productIds, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PaymentStateCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(_PaymentState value, $Res Function(_PaymentState) _then) = __$PaymentStateCopyWithImpl;
@override @useResult
$Res call({
 PaymentStatus status, List<String>? productIds, String? message
});




}
/// @nodoc
class __$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(this._self, this._then);

  final _PaymentState _self;
  final $Res Function(_PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? productIds = freezed,Object? message = freezed,}) {
  return _then(_PaymentState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,productIds: freezed == productIds ? _self._productIds : productIds // ignore: cast_nullable_to_non_nullable
as List<String>?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

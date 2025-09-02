// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kakao_user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KakaoUserState {

 Status get status; ErrorResponse get error; kakao.User? get user;
/// Create a copy of KakaoUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KakaoUserStateCopyWith<KakaoUserState> get copyWith => _$KakaoUserStateCopyWithImpl<KakaoUserState>(this as KakaoUserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KakaoUserState&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,status,error,user);

@override
String toString() {
  return 'KakaoUserState(status: $status, error: $error, user: $user)';
}


}

/// @nodoc
abstract mixin class $KakaoUserStateCopyWith<$Res>  {
  factory $KakaoUserStateCopyWith(KakaoUserState value, $Res Function(KakaoUserState) _then) = _$KakaoUserStateCopyWithImpl;
@useResult
$Res call({
 Status status, ErrorResponse error, kakao.User? user
});




}
/// @nodoc
class _$KakaoUserStateCopyWithImpl<$Res>
    implements $KakaoUserStateCopyWith<$Res> {
  _$KakaoUserStateCopyWithImpl(this._self, this._then);

  final KakaoUserState _self;
  final $Res Function(KakaoUserState) _then;

/// Create a copy of KakaoUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? error = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorResponse,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as kakao.User?,
  ));
}

}


/// Adds pattern-matching-related methods to [KakaoUserState].
extension KakaoUserStatePatterns on KakaoUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KakaoUserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KakaoUserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KakaoUserState value)  $default,){
final _that = this;
switch (_that) {
case _KakaoUserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KakaoUserState value)?  $default,){
final _that = this;
switch (_that) {
case _KakaoUserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status status,  ErrorResponse error,  kakao.User? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KakaoUserState() when $default != null:
return $default(_that.status,_that.error,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status status,  ErrorResponse error,  kakao.User? user)  $default,) {final _that = this;
switch (_that) {
case _KakaoUserState():
return $default(_that.status,_that.error,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status status,  ErrorResponse error,  kakao.User? user)?  $default,) {final _that = this;
switch (_that) {
case _KakaoUserState() when $default != null:
return $default(_that.status,_that.error,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _KakaoUserState implements KakaoUserState {
   _KakaoUserState({this.status = Status.initial, this.error = const ErrorResponse(), this.user});
  

@override@JsonKey() final  Status status;
@override@JsonKey() final  ErrorResponse error;
@override final  kakao.User? user;

/// Create a copy of KakaoUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KakaoUserStateCopyWith<_KakaoUserState> get copyWith => __$KakaoUserStateCopyWithImpl<_KakaoUserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KakaoUserState&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,status,error,user);

@override
String toString() {
  return 'KakaoUserState(status: $status, error: $error, user: $user)';
}


}

/// @nodoc
abstract mixin class _$KakaoUserStateCopyWith<$Res> implements $KakaoUserStateCopyWith<$Res> {
  factory _$KakaoUserStateCopyWith(_KakaoUserState value, $Res Function(_KakaoUserState) _then) = __$KakaoUserStateCopyWithImpl;
@override @useResult
$Res call({
 Status status, ErrorResponse error, kakao.User? user
});




}
/// @nodoc
class __$KakaoUserStateCopyWithImpl<$Res>
    implements _$KakaoUserStateCopyWith<$Res> {
  __$KakaoUserStateCopyWithImpl(this._self, this._then);

  final _KakaoUserState _self;
  final $Res Function(_KakaoUserState) _then;

/// Create a copy of KakaoUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? error = null,Object? user = freezed,}) {
  return _then(_KakaoUserState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorResponse,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as kakao.User?,
  ));
}


}

// dart format on

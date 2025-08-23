// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MenuEntity {

 int get tabId; String get title;
/// Create a copy of MenuEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuEntityCopyWith<MenuEntity> get copyWith => _$MenuEntityCopyWithImpl<MenuEntity>(this as MenuEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuEntity&&(identical(other.tabId, tabId) || other.tabId == tabId)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,tabId,title);

@override
String toString() {
  return 'MenuEntity(tabId: $tabId, title: $title)';
}


}

/// @nodoc
abstract mixin class $MenuEntityCopyWith<$Res>  {
  factory $MenuEntityCopyWith(MenuEntity value, $Res Function(MenuEntity) _then) = _$MenuEntityCopyWithImpl;
@useResult
$Res call({
 int tabId, String title
});




}
/// @nodoc
class _$MenuEntityCopyWithImpl<$Res>
    implements $MenuEntityCopyWith<$Res> {
  _$MenuEntityCopyWithImpl(this._self, this._then);

  final MenuEntity _self;
  final $Res Function(MenuEntity) _then;

/// Create a copy of MenuEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabId = null,Object? title = null,}) {
  return _then(_self.copyWith(
tabId: null == tabId ? _self.tabId : tabId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuEntity].
extension MenuEntityPatterns on MenuEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuEntity value)  $default,){
final _that = this;
switch (_that) {
case _MenuEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MenuEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tabId,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuEntity() when $default != null:
return $default(_that.tabId,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tabId,  String title)  $default,) {final _that = this;
switch (_that) {
case _MenuEntity():
return $default(_that.tabId,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tabId,  String title)?  $default,) {final _that = this;
switch (_that) {
case _MenuEntity() when $default != null:
return $default(_that.tabId,_that.title);case _:
  return null;

}
}

}

/// @nodoc


class _MenuEntity implements MenuEntity {
   _MenuEntity({required this.tabId, required this.title});
  

@override final  int tabId;
@override final  String title;

/// Create a copy of MenuEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuEntityCopyWith<_MenuEntity> get copyWith => __$MenuEntityCopyWithImpl<_MenuEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuEntity&&(identical(other.tabId, tabId) || other.tabId == tabId)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,tabId,title);

@override
String toString() {
  return 'MenuEntity(tabId: $tabId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$MenuEntityCopyWith<$Res> implements $MenuEntityCopyWith<$Res> {
  factory _$MenuEntityCopyWith(_MenuEntity value, $Res Function(_MenuEntity) _then) = __$MenuEntityCopyWithImpl;
@override @useResult
$Res call({
 int tabId, String title
});




}
/// @nodoc
class __$MenuEntityCopyWithImpl<$Res>
    implements _$MenuEntityCopyWith<$Res> {
  __$MenuEntityCopyWithImpl(this._self, this._then);

  final _MenuEntity _self;
  final $Res Function(_MenuEntity) _then;

/// Create a copy of MenuEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabId = null,Object? title = null,}) {
  return _then(_MenuEntity(
tabId: null == tabId ? _self.tabId : tabId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

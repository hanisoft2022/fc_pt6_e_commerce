// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_module_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewModuleEntity {

 String get type; String get title; String get subtitle; String get imageUrl; int get time; List<ProductInfoEntity> get products; List<String> get tabs;
/// Create a copy of ViewModuleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewModuleEntityCopyWith<ViewModuleEntity> get copyWith => _$ViewModuleEntityCopyWithImpl<ViewModuleEntity>(this as ViewModuleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewModuleEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other.products, products)&&const DeepCollectionEquality().equals(other.tabs, tabs));
}


@override
int get hashCode => Object.hash(runtimeType,type,title,subtitle,imageUrl,time,const DeepCollectionEquality().hash(products),const DeepCollectionEquality().hash(tabs));

@override
String toString() {
  return 'ViewModuleEntity(type: $type, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, time: $time, products: $products, tabs: $tabs)';
}


}

/// @nodoc
abstract mixin class $ViewModuleEntityCopyWith<$Res>  {
  factory $ViewModuleEntityCopyWith(ViewModuleEntity value, $Res Function(ViewModuleEntity) _then) = _$ViewModuleEntityCopyWithImpl;
@useResult
$Res call({
 String type, String title, String subtitle, String imageUrl, int time, List<ProductInfoEntity> products, List<String> tabs
});




}
/// @nodoc
class _$ViewModuleEntityCopyWithImpl<$Res>
    implements $ViewModuleEntityCopyWith<$Res> {
  _$ViewModuleEntityCopyWithImpl(this._self, this._then);

  final ViewModuleEntity _self;
  final $Res Function(ViewModuleEntity) _then;

/// Create a copy of ViewModuleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? time = null,Object? products = null,Object? tabs = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInfoEntity>,tabs: null == tabs ? _self.tabs : tabs // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ViewModuleEntity].
extension ViewModuleEntityPatterns on ViewModuleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewModuleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewModuleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewModuleEntity value)  $default,){
final _that = this;
switch (_that) {
case _ViewModuleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewModuleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ViewModuleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String title,  String subtitle,  String imageUrl,  int time,  List<ProductInfoEntity> products,  List<String> tabs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewModuleEntity() when $default != null:
return $default(_that.type,_that.title,_that.subtitle,_that.imageUrl,_that.time,_that.products,_that.tabs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String title,  String subtitle,  String imageUrl,  int time,  List<ProductInfoEntity> products,  List<String> tabs)  $default,) {final _that = this;
switch (_that) {
case _ViewModuleEntity():
return $default(_that.type,_that.title,_that.subtitle,_that.imageUrl,_that.time,_that.products,_that.tabs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String title,  String subtitle,  String imageUrl,  int time,  List<ProductInfoEntity> products,  List<String> tabs)?  $default,) {final _that = this;
switch (_that) {
case _ViewModuleEntity() when $default != null:
return $default(_that.type,_that.title,_that.subtitle,_that.imageUrl,_that.time,_that.products,_that.tabs);case _:
  return null;

}
}

}

/// @nodoc


class _ViewModuleEntity implements ViewModuleEntity {
   _ViewModuleEntity({required this.type, required this.title, required this.subtitle, required this.imageUrl, required this.time, required final  List<ProductInfoEntity> products, required final  List<String> tabs}): _products = products,_tabs = tabs;
  

@override final  String type;
@override final  String title;
@override final  String subtitle;
@override final  String imageUrl;
@override final  int time;
 final  List<ProductInfoEntity> _products;
@override List<ProductInfoEntity> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<String> _tabs;
@override List<String> get tabs {
  if (_tabs is EqualUnmodifiableListView) return _tabs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tabs);
}


/// Create a copy of ViewModuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewModuleEntityCopyWith<_ViewModuleEntity> get copyWith => __$ViewModuleEntityCopyWithImpl<_ViewModuleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewModuleEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._tabs, _tabs));
}


@override
int get hashCode => Object.hash(runtimeType,type,title,subtitle,imageUrl,time,const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_tabs));

@override
String toString() {
  return 'ViewModuleEntity(type: $type, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, time: $time, products: $products, tabs: $tabs)';
}


}

/// @nodoc
abstract mixin class _$ViewModuleEntityCopyWith<$Res> implements $ViewModuleEntityCopyWith<$Res> {
  factory _$ViewModuleEntityCopyWith(_ViewModuleEntity value, $Res Function(_ViewModuleEntity) _then) = __$ViewModuleEntityCopyWithImpl;
@override @useResult
$Res call({
 String type, String title, String subtitle, String imageUrl, int time, List<ProductInfoEntity> products, List<String> tabs
});




}
/// @nodoc
class __$ViewModuleEntityCopyWithImpl<$Res>
    implements _$ViewModuleEntityCopyWith<$Res> {
  __$ViewModuleEntityCopyWithImpl(this._self, this._then);

  final _ViewModuleEntity _self;
  final $Res Function(_ViewModuleEntity) _then;

/// Create a copy of ViewModuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? time = null,Object? products = null,Object? tabs = null,}) {
  return _then(_ViewModuleEntity(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInfoEntity>,tabs: null == tabs ? _self._tabs : tabs // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

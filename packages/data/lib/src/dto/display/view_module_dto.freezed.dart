// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_module_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewModuleDto {

 String get type; String get title; String get subtitle; String get imageUrl; List<ProductInfoDto> get products;
/// Create a copy of ViewModuleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewModuleDtoCopyWith<ViewModuleDto> get copyWith => _$ViewModuleDtoCopyWithImpl<ViewModuleDto>(this as ViewModuleDto, _$identity);

  /// Serializes this ViewModuleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewModuleDto&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,title,subtitle,imageUrl,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'ViewModuleDto(type: $type, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, products: $products)';
}


}

/// @nodoc
abstract mixin class $ViewModuleDtoCopyWith<$Res>  {
  factory $ViewModuleDtoCopyWith(ViewModuleDto value, $Res Function(ViewModuleDto) _then) = _$ViewModuleDtoCopyWithImpl;
@useResult
$Res call({
 String type, String title, String subtitle, String imageUrl, List<ProductInfoDto> products
});




}
/// @nodoc
class _$ViewModuleDtoCopyWithImpl<$Res>
    implements $ViewModuleDtoCopyWith<$Res> {
  _$ViewModuleDtoCopyWithImpl(this._self, this._then);

  final ViewModuleDto _self;
  final $Res Function(ViewModuleDto) _then;

/// Create a copy of ViewModuleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? products = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInfoDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ViewModuleDto].
extension ViewModuleDtoPatterns on ViewModuleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewModuleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewModuleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewModuleDto value)  $default,){
final _that = this;
switch (_that) {
case _ViewModuleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewModuleDto value)?  $default,){
final _that = this;
switch (_that) {
case _ViewModuleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String title,  String subtitle,  String imageUrl,  List<ProductInfoDto> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewModuleDto() when $default != null:
return $default(_that.type,_that.title,_that.subtitle,_that.imageUrl,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String title,  String subtitle,  String imageUrl,  List<ProductInfoDto> products)  $default,) {final _that = this;
switch (_that) {
case _ViewModuleDto():
return $default(_that.type,_that.title,_that.subtitle,_that.imageUrl,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String title,  String subtitle,  String imageUrl,  List<ProductInfoDto> products)?  $default,) {final _that = this;
switch (_that) {
case _ViewModuleDto() when $default != null:
return $default(_that.type,_that.title,_that.subtitle,_that.imageUrl,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViewModuleDto implements ViewModuleDto {
  const _ViewModuleDto({this.type = '', this.title = '', this.subtitle = '', this.imageUrl = '', final  List<ProductInfoDto> products = const <ProductInfoDto>[]}): _products = products;
  factory _ViewModuleDto.fromJson(Map<String, dynamic> json) => _$ViewModuleDtoFromJson(json);

@override@JsonKey() final  String type;
@override@JsonKey() final  String title;
@override@JsonKey() final  String subtitle;
@override@JsonKey() final  String imageUrl;
 final  List<ProductInfoDto> _products;
@override@JsonKey() List<ProductInfoDto> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of ViewModuleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewModuleDtoCopyWith<_ViewModuleDto> get copyWith => __$ViewModuleDtoCopyWithImpl<_ViewModuleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViewModuleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewModuleDto&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,title,subtitle,imageUrl,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'ViewModuleDto(type: $type, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, products: $products)';
}


}

/// @nodoc
abstract mixin class _$ViewModuleDtoCopyWith<$Res> implements $ViewModuleDtoCopyWith<$Res> {
  factory _$ViewModuleDtoCopyWith(_ViewModuleDto value, $Res Function(_ViewModuleDto) _then) = __$ViewModuleDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String title, String subtitle, String imageUrl, List<ProductInfoDto> products
});




}
/// @nodoc
class __$ViewModuleDtoCopyWithImpl<$Res>
    implements _$ViewModuleDtoCopyWith<$Res> {
  __$ViewModuleDtoCopyWithImpl(this._self, this._then);

  final _ViewModuleDto _self;
  final $Res Function(_ViewModuleDto) _then;

/// Create a copy of ViewModuleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? products = null,}) {
  return _then(_ViewModuleDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInfoDto>,
  ));
}


}

// dart format on

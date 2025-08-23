// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductInfoEntity {

 String get productId; String get title; String get subtitle; String get imageUrl; int get price; int get originalPrice; int get discountRate; int get reviewCount;
/// Create a copy of ProductInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductInfoEntityCopyWith<ProductInfoEntity> get copyWith => _$ProductInfoEntityCopyWithImpl<ProductInfoEntity>(this as ProductInfoEntity, _$identity);

  /// Serializes this ProductInfoEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductInfoEntity&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,title,subtitle,imageUrl,price,originalPrice,discountRate,reviewCount);

@override
String toString() {
  return 'ProductInfoEntity(productId: $productId, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, price: $price, originalPrice: $originalPrice, discountRate: $discountRate, reviewCount: $reviewCount)';
}


}

/// @nodoc
abstract mixin class $ProductInfoEntityCopyWith<$Res>  {
  factory $ProductInfoEntityCopyWith(ProductInfoEntity value, $Res Function(ProductInfoEntity) _then) = _$ProductInfoEntityCopyWithImpl;
@useResult
$Res call({
 String productId, String title, String subtitle, String imageUrl, int price, int originalPrice, int discountRate, int reviewCount
});




}
/// @nodoc
class _$ProductInfoEntityCopyWithImpl<$Res>
    implements $ProductInfoEntityCopyWith<$Res> {
  _$ProductInfoEntityCopyWithImpl(this._self, this._then);

  final ProductInfoEntity _self;
  final $Res Function(ProductInfoEntity) _then;

/// Create a copy of ProductInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? price = null,Object? originalPrice = null,Object? discountRate = null,Object? reviewCount = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int,discountRate: null == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as int,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductInfoEntity].
extension ProductInfoEntityPatterns on ProductInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProductInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProductInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String title,  String subtitle,  String imageUrl,  int price,  int originalPrice,  int discountRate,  int reviewCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductInfoEntity() when $default != null:
return $default(_that.productId,_that.title,_that.subtitle,_that.imageUrl,_that.price,_that.originalPrice,_that.discountRate,_that.reviewCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String title,  String subtitle,  String imageUrl,  int price,  int originalPrice,  int discountRate,  int reviewCount)  $default,) {final _that = this;
switch (_that) {
case _ProductInfoEntity():
return $default(_that.productId,_that.title,_that.subtitle,_that.imageUrl,_that.price,_that.originalPrice,_that.discountRate,_that.reviewCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String title,  String subtitle,  String imageUrl,  int price,  int originalPrice,  int discountRate,  int reviewCount)?  $default,) {final _that = this;
switch (_that) {
case _ProductInfoEntity() when $default != null:
return $default(_that.productId,_that.title,_that.subtitle,_that.imageUrl,_that.price,_that.originalPrice,_that.discountRate,_that.reviewCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductInfoEntity implements ProductInfoEntity {
  const _ProductInfoEntity({required this.productId, required this.title, required this.subtitle, required this.imageUrl, required this.price, required this.originalPrice, required this.discountRate, required this.reviewCount});
  factory _ProductInfoEntity.fromJson(Map<String, dynamic> json) => _$ProductInfoEntityFromJson(json);

@override final  String productId;
@override final  String title;
@override final  String subtitle;
@override final  String imageUrl;
@override final  int price;
@override final  int originalPrice;
@override final  int discountRate;
@override final  int reviewCount;

/// Create a copy of ProductInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductInfoEntityCopyWith<_ProductInfoEntity> get copyWith => __$ProductInfoEntityCopyWithImpl<_ProductInfoEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductInfoEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductInfoEntity&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,title,subtitle,imageUrl,price,originalPrice,discountRate,reviewCount);

@override
String toString() {
  return 'ProductInfoEntity(productId: $productId, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, price: $price, originalPrice: $originalPrice, discountRate: $discountRate, reviewCount: $reviewCount)';
}


}

/// @nodoc
abstract mixin class _$ProductInfoEntityCopyWith<$Res> implements $ProductInfoEntityCopyWith<$Res> {
  factory _$ProductInfoEntityCopyWith(_ProductInfoEntity value, $Res Function(_ProductInfoEntity) _then) = __$ProductInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String productId, String title, String subtitle, String imageUrl, int price, int originalPrice, int discountRate, int reviewCount
});




}
/// @nodoc
class __$ProductInfoEntityCopyWithImpl<$Res>
    implements _$ProductInfoEntityCopyWith<$Res> {
  __$ProductInfoEntityCopyWithImpl(this._self, this._then);

  final _ProductInfoEntity _self;
  final $Res Function(_ProductInfoEntity) _then;

/// Create a copy of ProductInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? price = null,Object? originalPrice = null,Object? discountRate = null,Object? reviewCount = null,}) {
  return _then(_ProductInfoEntity(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int,discountRate: null == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as int,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

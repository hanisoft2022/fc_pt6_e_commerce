// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartEntity _$CartEntityFromJson(Map<String, dynamic> json) => _CartEntity(
  productInfo: ProductInfoEntity.fromJson(
    json['productInfo'] as Map<String, dynamic>,
  ),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CartEntityToJson(_CartEntity instance) =>
    <String, dynamic>{
      'productInfo': instance.productInfo,
      'quantity': instance.quantity,
    };

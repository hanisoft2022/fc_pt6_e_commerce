import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_entity.freezed.dart';
part 'cart_entity.g.dart';

@freezed
abstract class CartEntity with _$CartEntity {
  factory CartEntity({required ProductInfoEntity productInfo, required int quantity}) = _CartEntity;

  factory CartEntity.fromJson(Map<String, dynamic> json) => _$CartEntityFromJson(json);
}

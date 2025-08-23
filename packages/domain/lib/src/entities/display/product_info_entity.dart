import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info_entity.freezed.dart';
part 'product_info_entity.g.dart';

@freezed
abstract class ProductInfoEntity with _$ProductInfoEntity {
  const factory ProductInfoEntity({
    required String productId,
    required String title,
    required String subtitle,
    required String imageUrl,
    required int price,
    required int originalPrice,
    required int discountRate,
    required int reviewCount,
  }) = _ProductInfoEntity;

  factory ProductInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoEntityFromJson(json);
}

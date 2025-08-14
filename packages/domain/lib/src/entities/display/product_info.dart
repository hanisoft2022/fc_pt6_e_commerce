import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info.freezed.dart';

@freezed
abstract class ProductInfo with _$ProductInfo {
  factory ProductInfo({
    required String productId,
    required String title,
    required String subtitle,
    required String imageUrl,
    required int price,
    required int originalPrice,
    required int discountRate,
    required int reviewCount,
  }) = _ProductInfo;
}

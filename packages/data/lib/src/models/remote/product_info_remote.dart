// data/model/product_info_remote.dart

import '../../../data.dart';

class ProductInfoRemote {
  final String productId;
  final String title;
  final String subtitle;
  final String imageUrl;
  final int price;
  final int originalPrice;
  final int discountRate;
  final int reviewCount;

  ProductInfoRemote({
    required this.productId,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.discountRate,
    required this.reviewCount,
  });

  // Firestore 문서(Map) → Remote Model 변환
  factory ProductInfoRemote.fromFirestore(Map<String, dynamic> doc) {
    return ProductInfoRemote(
      productId: doc['productId'] ?? '',
      title: doc['title'] ?? '',
      subtitle: doc['subtitle'] ?? '',
      imageUrl: doc['imageUrl'] ?? '',
      price: doc['price'] ?? -1,
      originalPrice: doc['originalPrice'] ?? -1,
      discountRate: doc['discountRate'] ?? -1,
      reviewCount: doc['reviewCount'] ?? -1,
    );
  }

  // Firestore로 저장 가능한 Map 변환 메서드
  Map<String, dynamic> toFirestore() {
    return {
      'productId': productId,
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'price': price,
      'originalPrice': originalPrice,
      'discountRate': discountRate,
      'reviewCount': reviewCount,
    };
  }

  // DTO → Remote Model 변환 메서드 (필요시)
  factory ProductInfoRemote.fromDto(ProductInfoDto dto) {
    return ProductInfoRemote(
      productId: dto.productId,
      title: dto.title,
      subtitle: dto.subtitle,
      imageUrl: dto.imageUrl,
      price: dto.price,
      originalPrice: dto.originalPrice,
      discountRate: dto.discountRate,
      reviewCount: dto.reviewCount,
    );
  }

  // Remote Model → DTO 변환 메서드
  ProductInfoDto toDto() {
    return ProductInfoDto(
      productId: productId,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      price: price,
      originalPrice: originalPrice,
      discountRate: discountRate,
      reviewCount: reviewCount,
    );
  }
}

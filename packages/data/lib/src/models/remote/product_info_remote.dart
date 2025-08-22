import 'package:data/data.dart';

class ProductInfoRemote {
  late String productId;
  late String title;
  late String subtitle;
  late String imageUrl;
  late int price;
  late int originalPrice;
  late int discountRate;
  late int reviewCount;

  ProductInfoRemote();

  // DTO → Firestore 모델 변환용 생성자 예시 (선택적)
  ProductInfoRemote.fromDto(ProductInfoDto dto) {
    productId = dto.productId;
    title = dto.title;
    subtitle = dto.subtitle;
    imageUrl = dto.imageUrl;
    price = dto.price;
    originalPrice = dto.originalPrice;
    discountRate = dto.discountRate;
    reviewCount = dto.reviewCount;
  }

  // Firestore 모델 → DTO 변환용 메서드 예시 (선택적)
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


// for commit
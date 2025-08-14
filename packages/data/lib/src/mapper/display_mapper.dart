import 'package:data/data.dart';
import 'package:domain/domain.dart';

extension MenuX on MenuDto {
  Menu toEntity() {
    return Menu(tabId: tabId, title: title);
  }
}

extension ViewModuleX on ViewModuleDto {
  ViewModule toEntity() {
    return ViewModule(
      type: type,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      products: products.map((dto) => dto.toEntity()).toList(),
    );
  }
}

extension ProductInfoX on ProductInfoDto {
  ProductInfo toEntity() {
    return ProductInfo(
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

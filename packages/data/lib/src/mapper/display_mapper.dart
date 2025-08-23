import 'package:data/data.dart';
import 'package:domain/domain.dart';

extension MenuX on MenuDto {
  MenuEntity toEntity() {
    return MenuEntity(tabId: tabId, title: title);
  }
}

extension ViewModuleX on ViewModuleDto {
  ViewModuleEntity toEntity() {
    return ViewModuleEntity(
      type: type,
      title: title,
      time: time,
      subtitle: subtitle,
      imageUrl: imageUrl,
      products: products.map((dto) => dto.toEntity()).toList(),
      tabs: tabs,
    );
  }
}

extension ProductInfoX on ProductInfoDto {
  ProductInfoEntity toEntity() {
    return ProductInfoEntity(
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

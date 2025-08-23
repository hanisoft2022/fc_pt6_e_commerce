import 'package:data/data.dart';
import 'package:domain/domain.dart';

extension MenuDtoX on MenuDto {
  MenuEntity toEntity() {
    return MenuEntity(tabId: tabId, title: title);
  }
}

extension ViewModuleDtoX on ViewModuleDto {
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

extension ProductInfoDtoX on ProductInfoDto {
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

extension ProductInfoRemoteModelX on ProductInfoRemoteModel {
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

// Model -> Entity
extension CartModelX on CartRemoteModel {
  CartEntity toEntity() {
    return CartEntity(productInfo: productInfo.toEntity(), quantity: quantity);
  }
}

extension CartEntityX on CartEntity {
  CartRemoteModel toRemoteModel() {
    return CartRemoteModel(productInfo: productInfo.toRemoteModel(), quantity: quantity);
  }
}

extension ProductInfoEntityX on ProductInfoEntity {
  ProductInfoRemoteModel toRemoteModel() {
    return ProductInfoRemoteModel(
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

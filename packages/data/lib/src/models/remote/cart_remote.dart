import 'package:data/data.dart';

class CartRemote {
  final ProductInfoRemote productInfo;
  final int quantity;

  CartRemote({required this.productInfo, required this.quantity});

  factory CartRemote.fromJson(Map<String, dynamic> json) {
    return CartRemote(
      productInfo: ProductInfoRemote.fromFirestore(json['productInfo']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'productInfo': productInfo.toFirestore(), 'quantity': quantity};
  }
}

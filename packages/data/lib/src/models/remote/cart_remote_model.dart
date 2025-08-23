import 'package:data/data.dart';

class CartRemoteModel {
  final ProductInfoRemoteModel productInfo;
  final int quantity;

  CartRemoteModel({required this.productInfo, required this.quantity});

  factory CartRemoteModel.fromJson(Map<String, dynamic> json) {
    return CartRemoteModel(
      productInfo: ProductInfoRemoteModel.fromFirestore(json['productInfo']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'productInfo': productInfo.toFirestore(), 'quantity': quantity};
  }
}

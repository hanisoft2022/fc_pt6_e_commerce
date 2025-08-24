import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../../data.dart';

class DisplayDao {
  final DisplayApi _displayApi;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DisplayDao(this._displayApi);

  Future<ResponseWrapper<List<MenuEntity>>> getMenus({required MallType mallType}) async {
    final ResponseWrapper<List<MenuDto>> response = await _displayApi.getMenus(mallType.name);

    return response.toEntity<List<MenuEntity>>(
      response.data?.map((dto) => dto.toEntity()).toList() ?? [],
    );
  }

  Future<ResponseWrapper<List<ViewModuleEntity>>> getViewModules({
    required int tabId,
    required int page,
  }) async {
    final ResponseWrapper<List<ViewModuleDto>> response = await _displayApi.getViewModulues(
      tabId,
      page,
    );

    return response.toEntity<List<ViewModuleEntity>>(
      response.data?.map((dto) => dto.toEntity()).toList() ?? [],
    );
  }

  Future<ResponseWrapper<List<CartEntity>>> addToCart(CartEntity cart) async {
    final productId = cart.productInfo.productId;
    final docRef = _db.collection('cart');

    if (await docRef.doc(productId).get().then((snapshot) => snapshot.exists)) {
      return ResponseWrapper<List<CartEntity>>(
        status: '이미 존재하는 상품 ::: ${cart.productInfo.title}',
        code: 'CART-1000',
        message: '이미 장바구니에 존재하는 상품입니다.',
        data: [],
      );
    }

    await docRef.doc(productId).set(cart.toRemoteModel().toFirestore());

    final snapshot = await docRef.get();

    return ResponseWrapper<List<CartEntity>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 담기 성공',
      data: snapshot.docs.map((doc) => CartRemoteModel.fromJson(doc.data()).toEntity()).toList(),
    );
  }

  Future<ResponseWrapper<List<CartEntity>>> getCartList() async {
    final snapshot = await _db.collection('cart').get();

    return ResponseWrapper<List<CartEntity>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 리스트 불러오기 성공',
      data: snapshot.docs.map((doc) => CartRemoteModel.fromJson(doc.data()).toEntity()).toList(),
    );
  }

  Future<ResponseWrapper<List<CartEntity>>> changeCartProductQty(
    String productId,
    int quantity,
  ) async {
    final docRef = _db.collection('cart').doc(productId);

    await docRef.update({'quantity': quantity});

    final snapshot = await _db.collection('cart').get();

    return ResponseWrapper<List<CartEntity>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 수량 변경 성공',
      data: snapshot.docs.map((doc) => CartRemoteModel.fromJson(doc.data()).toEntity()).toList(),
    );
  }

  Future<ResponseWrapper<List<CartEntity>>> deleteCartProduct(List<String> productIds) async {
    final collectionRef = _db.collection('cart');

    for (final productId in productIds) {
      await collectionRef.doc(productId).delete();
    }

    final snapshot = await collectionRef.get();

    return ResponseWrapper<List<CartEntity>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 상품 삭제 성공',
      data: snapshot.docs.map((doc) => CartRemoteModel.fromJson(doc.data()).toEntity()).toList(),
    );
  }

  Future<ResponseWrapper<List<CartEntity>>> clearCart() async {
    final collectionRef = _db.collection('cart');

    final snapshot = await collectionRef.get();

    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }

    final updatedSnapshot = await collectionRef.get();

    return ResponseWrapper<List<CartEntity>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 전체 삭제 성공',
      data: updatedSnapshot.docs
          .map((doc) => CartRemoteModel.fromJson(doc.data()).toEntity())
          .toList(),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data.dart';

class DisplayDao {
  final db = FirebaseFirestore.instance;

  // //뷰 모듈 불러오기
  // Future<List<ViewModule>> getViewModules(String key, page) async {
  //   final localStorage = await Hive.openBox<ViewModuleListEntity>(key);

  //   final ViewModuleListEntity? result = await localStorage.get(page);
  //   if (result == null) return [];

  //   return result.viewModules.map((e) => e.toModel()).toList();
  // }

  // //뷰 모듈 저장하기
  // Future<void> insertViewModules(String key, int page, ViewModuleListEntity viewModules) async {
  //   final localStorage = await Hive.openBox<ViewModuleListEntity>(key);
  //   await localStorage.put(page, viewModules);
  // }

  // // 뷰모듈 리스트 리프레쉬
  // Future<void> clearViewModules(String key) async {
  //   final localStorage = await Hive.openBox<ViewModuleListEntity>(key);

  //   await localStorage.clear();
  // }

  // // 뷰모듈 리스트 삭제
  // Future<void> deleteViewModules(String key, int page) async {
  //   final localStorage = await Hive.openBox<ViewModuleListEntity>(key);

  //   await localStorage.delete(page);
  // }

  // /// 장바구니 리스트 불러오기
  // Future<ResponseWrapper<List<CartEntity>>> getCartList() async {
  //   final localStorage = await Hive.openBox<Cart>(_cartDb);

  //   return ResponseWrapper(
  //     status: 'SUCCESS',
  //     code: '0000',
  //     message: '장바구니 리스트 불러오기 성공',
  //     data: localStorage.values.toList(),
  //   );
  // }

  /// 장바구니 리스트 불러오기
  Future<ResponseWrapper<List<CartRemoteModel>>> getCartList() async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection('cart');

    final snapshot = await docRef.get();

    return ResponseWrapper<List<CartRemoteModel>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 리스트 불러오기 성공',
      data: snapshot.docs.map((e) => CartRemoteModel.fromJson(e.data())).toList(),
    );
  }

  // /// 장바구니 상품 담기
  // Future<ResponseWrapper<List<CartEntity>>> insertCart(CartEntity cart) async {
  //   final localStorage = await Hive.openBox<CartEntity>(_cartDb);
  //   final productId = cart.product.productId;
  //   // 이미 장바구니에 존재하는 상품
  //   if (localStorage.get(productId) != null) {
  //     final status = '이미 존재하는 상품 ::: ${cart.product.title}';
  //     final code = 'CART-1000';
  //     final message = '이미 장바구니에 존재하는 상품입니다.';

  //     return ResponseWrapper(
  //       status: status,
  //       code: code,
  //       message: message,
  //       data: localStorage.values.toList(),
  //     );
  //   }
  //   await localStorage.put(productId, cart);

  //   return ResponseWrapper(
  //     status: 'SUCCESS',
  //     code: '0000',
  //     message: '장바구니 담기 성공',
  //     data: localStorage.values.toList(),
  //   );
  // }

  /// 장바구니 상품 담기
  Future<ResponseWrapper<List<CartRemoteModel>>> addtoCart(CartRemoteModel cart) async {
    final productId = cart.productInfo.productId;

    final db = FirebaseFirestore.instance;
    final docRef = db.collection('cart');

    if (await docRef.doc(productId).get().then((value) => value.exists)) {
      return ResponseWrapper<List<CartRemoteModel>>(
        status: '이미 존재하는 상품 ::: ${cart.productInfo.title}',
        code: 'CART-1000',
        message: '이미 장바구니에 존재하는 상품입니다.',
        data: [],
      );
    }

    await docRef.doc(productId).set(cart.toFirestore());

    final snapshot = await docRef.get();

    return ResponseWrapper<List<CartRemoteModel>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 담기 성공',
      data: snapshot.docs.map((e) => CartRemoteModel.fromJson(e.data())).toList(),
    );
  }

  // // 장바구니에 담긴 상품 삭제 by productId
  // Future<ResponseWrapper<List<CartEntity>>> deleteCart(List<String> productIds) async {
  //   final localStorage = await Hive.openBox<CartEntity>(_cartDb);
  //   await localStorage.deleteAll(productIds);

  //   return ResponseWrapper(
  //     status: 'SUCCESS',
  //     code: '0000',
  //     message: '장바구니 $productIds 해당상품 삭제 성공',
  //     data: localStorage.values.toList(),
  //   );
  // }

  /// 장바구니에 담긴 상품 삭제 by productId
  Future<ResponseWrapper<List<CartRemoteModel>>> deleteCartItem(List<String> productIds) async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection('cart');

    for (final productId in productIds) {
      await docRef.doc(productId).delete();
    }

    final snapshot = await docRef.get();

    return ResponseWrapper<List<CartRemoteModel>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 $productIds 상품 삭제 성공',
      data: snapshot.docs.map((e) => CartRemoteModel.fromJson(e.data())).toList(),
    );
  }

  // // 장바구니 전체 삭제
  // Future<ResponseWrapper<List<CartEntity>>> clearCarts() async {
  //   final localStorage = await Hive.openBox<CartEntity>(_cartDb);
  //   await localStorage.clear();

  //   return ResponseWrapper(status: 'SUCCESS', code: '0000', message: '장바구니 전체 삭제 성공', data: []);
  // }

  /// 장바구니 상품 전체 삭제
  Future<ResponseWrapper<List<CartRemoteModel>>> clearCart() async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection('cart');

    await docRef.get().then((snapshot) {
      for (final doc in snapshot.docs) {
        doc.reference.delete();
      }
    });

    final snapshot = await docRef.get();

    return ResponseWrapper<List<CartRemoteModel>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 전체 삭제 성공',
      data: snapshot.docs.map((e) => CartRemoteModel.fromJson(e.data())).toList(),
    );
  }

  // ///장바구니 수량 변경
  // Future<ResponseWrapper<List<CartEntity>>> changeQtyCart(String productId, int quantity) async {
  //   final localStorage = await Hive.openBox<CartEntity>(_cartDb);
  //   final curCart = localStorage.get(productId);
  //   if (curCart == null) {
  //     final status = '장바구니 인스턴스가 존재하지 않습니다.';
  //     final code = 'CART-0001';
  //     final message = '네트워크 오류가 발생했습니다. 잠시 후에 다시 시도해주세요.';

  //     return ResponseWrapper(status: status, code: code, message: message);
  //   }

  //   final nextCart = CartEntity(product: curCart.product, quantity: quantity);
  //   await localStorage.put(productId, nextCart);

  //   return ResponseWrapper(
  //     status: 'SUCCESS',
  //     code: '0000',
  //     message: '장바구니 갯수 변경 성공',
  //     data: localStorage.values.toList(),
  //   );
  // }

  /// 장바구니 수량 변경
  Future<ResponseWrapper<List<CartRemoteModel>>> changeCartItemQty(
    String productId,
    int quantity,
  ) async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection('cart');

    await docRef.doc(productId).update({'quantity': quantity});

    final snapshot = await docRef.get();

    final item = snapshot.docs.where((element) => element.id == productId).first;

    return ResponseWrapper<List<CartRemoteModel>>(
      status: 'SUCCESS',
      code: '0000',
      message: '장바구니 $item의 수량 변경 완료.',
      data: snapshot.docs.map((e) => CartRemoteModel.fromJson(e.data())).toList(),
    );
  }
}

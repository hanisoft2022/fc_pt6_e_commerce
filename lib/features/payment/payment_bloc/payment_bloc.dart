import 'dart:async';
import 'dart:convert';

import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
// import 'package:bootpay/model/user.dart' as pay_user;
import 'package:domain/domain.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'payment_event.dart';

part 'payment_state.dart';

part 'payment_bloc.freezed.dart';

enum PaymentStatus { initial, success, failure }

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState()) {
    on<PaymentRequested>(_onPaymentRequested);
  }

  Future<void> _onPaymentRequested(PaymentRequested event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(status: PaymentStatus.initial));

    try {
      // final user = event.context.read<UserBloc>().state.user;

      // if (user == null) {
      //   FirebaseCrashlytics.instance.setCustomKey(
      //     'ProductInfo',
      //     event.cartProducts.first.productInfo.title,
      //   );
      //   FirebaseCrashlytics.instance.log("[PaymenyError] No User Exception");

      //   emit(state.copyWith(status: PaymentStatus.failure, message: '로그인 후 이용해주세요'));

      //   throw Exception();
      // }

      Payload payload = _getPayLoad(
        event.cartProducts,
        // , user
      );

      final (bool isSuccess, String? data) = await _bootPay(event.context, payload);

      if (isSuccess) {
        emit(
          state.copyWith(
            status: PaymentStatus.success,
            productIds: event.cartProducts.map((cart) => cart.productInfo.productId).toList(),
          ),
        );
      } else {
        var message = '결제를 실패했습니다. 잠시 후 다시 시도해주세요';
        if (data != null) {
          final decoded = jsonDecode(data);
          message = decoded['message'] ?? message;
        }
        emit(state.copyWith(status: PaymentStatus.failure, message: message));
      }
    } catch (e) {
      await FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
    }
  }
}

Payload _getPayLoad(
  List<CartEntity> cartList,
  // , User? loginUser
) {
  // 결제 요청 정보를 담을 Payload 객체 생성.
  Payload payload = Payload();

  // 장바구니 전체 결제 금액을 누적하여 저장할 변수.
  double totalPrice = 0.0;

  // 장바구니에 담긴 각 상품을 Bootpay의 Item 형태로 변환하여 itemList에 담음.
  // 각 상품의 이름, 수량, 고유 ID, 가격 정보를 설정.
  // 그리고 각각의 상품 가격 * 수량만큼 전체 금액에 합산.
  List<Item> itemList = cartList.map((cart) {
    Item item = Item(); // Bootpay에 전달할 단일 상품 정보를 담는 객체

    item.name = cart.productInfo.title; // 상품명
    item.qty = cart.quantity; // 구매 수량
    item.id = cart.productInfo.productId; // 상품 고유 ID
    item.price = cart.productInfo.price.toDouble(); // 단가(정수->실수 변환)

    // 전체 결제 금액에 현재 상품의 (가격 x 수량) 더하기
    totalPrice += (cart.productInfo.price * cart.quantity).toDouble();

    return item; // 리스트에 추가될 Item 객체 반환
  }).toList();

  // Bootpay 결제 연동을 위한 앱 고유 키를 설정.
  payload.androidApplicationId = '68adb8a5285ac508a5ee7ea1';
  payload.iosApplicationId = '68adb8a5285ac508a5ee7ea2';

  // 결제 PG사(여기서는 'kcp')를 설정.
  payload.pg = 'kcp';

  // 주문명 설정.
  // 상품이 여러 개일 때 "첫번째 상품명 외 n건" 형식으로, 하나면 그냥 그 상품명만 저장함.
  payload.orderName = cartList.length > 1
      ? '${cartList.first.productInfo.title} 외 ${cartList.length - 1}건'
      : cartList.first.productInfo.title;

  // 결제 총 금액을 payload에 넣어줌.
  payload.price = totalPrice;

  // 주문 고유 번호(여기서는 현재 시간의 millisecond로 생성, 중복 방지)
  payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

  // 실제 결제 상품 리스트(itemList)를 payload에 넣어줌.
  payload.items = itemList;

  // (주석처리된 부분: 사용자의 정보가 필요할 때 활용할 수 있음.)
  // pay_user.User user = pay_user.User();
  // user.id = loginUser?.id.toString();
  // user.username = loginUser?.kakaoAccount?.profile?.nickname;

  // 결제 관련 추가 설정을 위한 Extra 객체를 생성.
  Extra extra = Extra();
  // 앱 내 결제 완료 후 복귀를 위한 앱 스킴을 설정. (ex: facamMarket://)
  extra.appScheme = 'facamMarketTest';

  // payload에 Extra 속성을 추가합니다.
  payload.extra = extra;

  // 최종적으로 결제 출력을 위한 payload 객체를 반환.
  return payload;
}

Future<(bool, String?)> _bootPay(BuildContext context, Payload payload) async {
  // Completer는 Future를 수동으로 완료시키기 위해 사용.
  // Bootpay 콜백 구조가 비동기 작업이지만 Future를 직접 제공하지 않아서 이걸 만듦.
  final Completer<(bool, String?)> completer = Completer();

  // 결제 상태와 데이터를 저장하는 튜플 변수 초기화 (기본: 실패 상태, 빈 데이터)
  (bool, String?) response = (false, '');

  // Bootpay의 결제 요청 실행
  Bootpay().requestPayment(
    context: context, // 위젯 트리 내의 BuildContext, UI 처리를 위해 필요
    payload: payload, // 앞서 준비한 결제 데이터 (금액, 상품정보 등)
    showCloseButton: false, // 결제창에 닫기 버튼 표시 여부
    // 사용자가 결제를 취소했을 때 호출되는 콜백
    onCancel: (String data) {
      response = (false, data); // 실패 상태, 취소 관련 데이터 저장
    },

    // 결제 중 오류가 발생했을 때 호출되는 콜백
    onError: (String data) {
      Bootpay().dismiss(context); // 결제창 닫기
      response = (false, data); // 실패 상태, 오류 데이터 저장
    },

    // 결제 확인 단계에서 호출, true 반환 시 결제 진행 허용
    onConfirm: (String data) {
      return true; // 무조건 결제 진행
    },

    // 결제가 완료됐을 때 호출되는 콜백
    onDone: (String data) {
      response = (true, data); // 성공 상태, 완료 데이터 저장
    },

    // 결제 창이 닫힐 때 호출 (취소, 완료 등 모든 경우에 해당)
    onClose: () {
      Bootpay().dismiss(context); // 결제창 닫기
      completer.complete(response); // 기다리는 Future를 완료시키며 결과 반환
    },
  );

  // completer.future는 onClose가 호출되어 complete 될 때까지 대기하는 Future임
  return completer.future;
}

import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:data/data.dart';

class KakaoUserDao {
  Future<ResponseWrapper<User?>> getKakaoUser() async {
    // 1. 기존 토큰이 유효하다면 사용자 정보만 반환 (자동 로그인)
    if (await AuthApi.instance.hasToken()) {
      try {
        final user = await UserApi.instance.me();
        return ResponseWrapper<User?>(
          code: '200',
          status: 'SUCCESS',
          message: '자동 로그인 성공',
          data: user,
        );
      } catch (error) {
        // 토큰 만료 또는 기타 오류 시에는 아래에서 재로그인 시도
      }
    }

    // 2. 카카오톡/카카오계정으로 로그인
    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }
    } catch (error) {
      // 사용자가 로그인 화면에서 취소한 경우
      if (error is PlatformException && error.code == 'CANCELED') {
        return ResponseWrapper<User?>(
          code: '401',
          status: 'CANCELED',
          message: '사용자가 로그인 취소함',
          data: null,
        );
      }
      // 카카오톡 계정 연결이 안 되어 있거나 기타 사유로 카카오계정 로그인 추가 시도
      try {
        await UserApi.instance.loginWithKakaoAccount();
      } catch (e) {
        if (e is PlatformException && e.code == 'CANCELED') {
          return ResponseWrapper<User?>(
            code: '500',
            status: 'FAIL',
            message: '카카오 계정 로그인 실패: ${e.toString()}',
            data: null,
          );
        }
        CustomLogger.logger.e(e);
      }
    }

    // 3. 사용자 정보 반환
    try {
      final user = await UserApi.instance.me();
      return ResponseWrapper<User?>(code: '200', status: 'SUCCESS', message: '로그인 성공', data: user);
    } catch (error) {
      return ResponseWrapper<User?>(
        code: '501',
        status: 'FAIL',
        message: '사용자 정보 요청 실패: ${error.toString()}',
        data: null,
      );
    }
  }
}

// ignore_for_file: avoid_print

import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

@injectable
class KakaoUserDao {
  Future<User?> getKakaoUser() async {
    // 1. 카카오톡/카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          return null;
        }

        await _loginWithKakaoAccount();
      }
    } else {
      await _loginWithKakaoAccount();
    }

    // 2. 사용자 정보 반환
    return await UserApi.instance.me();
  }

  Future<User?> loginWithToken() async {
    if (await AuthApi.instance.hasToken()) {
      try {
        await UserApi.instance.accessTokenInfo();
      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          CustomLogger.logger.w('토큰 만료 또는 유효하지 않음: ${error.message}');
        } else {
          CustomLogger.logger.e('엑세스 토큰 정보 조회 실패: $error');
          throw CommonException.setError(error);
        }
      }
    } else {
      return null;
    }

    return await UserApi.instance.me();
  }

  Future<void> logout() async {
    try {
      await UserApi.instance.logout();
    } catch (error) {
      CustomLogger.logger.e(error);
      throw CommonException.setError(error);
    }
  }
}

Future<void> _loginWithKakaoAccount() async {
  try {
    await UserApi.instance.loginWithKakaoAccount();
  } catch (error) {
    if (error is PlatformException && error.code == 'CANCELED') {
      return;
    }

    CustomLogger.logger.e(error);
    throw CommonException.setError(error);
  }
}

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

@Singleton(as: UserRepository)
abstract class UserRepositoryImpl implements UserRepository {
  @override
  Future<ResponseWrapper<User?>> getKakaoUser() async {
    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
      } catch (error) {
        // 사용자가 로그인 화면에서 취소 버튼을 누른 경우 처리
        if (error is PlatformException && error.code == 'CANCELED') {
          return ResponseWrapper<User?>(
            code: '401',
            status: 'CANCELED',
            message: '사용자가 로그인 취소함',
            data: null,
          );
        }
        try {
          await UserApi.instance.loginWithKakaoAccount();
        } catch (error) {}
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
      } catch (error) {}
    }

    final User user = await UserApi.instance.me();
    return ResponseWrapper<User?>(code: '200', status: 'SUCCESS', message: 'success', data: user);
  }
}

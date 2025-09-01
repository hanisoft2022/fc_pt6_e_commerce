import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:data/data.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

@Singleton(as: UserRepository)
class KakaoUserRepositoryImpl implements UserRepository {
  final KakaoUserDao _kakaoUserDao;

  KakaoUserRepositoryImpl(this._kakaoUserDao);

  @override
  Future<User?> getKakaoUser() async {
    return await _kakaoUserDao.getKakaoUser();
  }

  @override
  Future<User?> loginWithToken() async {
    return await _kakaoUserDao.loginWithToken();
  }

  @override
  Future<void> logout() {
    return _kakaoUserDao.logout();
  }
}

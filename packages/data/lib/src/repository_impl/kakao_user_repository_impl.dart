import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:data/data.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final KakaoUserDao _kakaoUserDao;

  UserRepositoryImpl(this._kakaoUserDao);

  @override
  Future<ResponseWrapper<User?>> getKakaoUser() async {
    return await _kakaoUserDao.getKakaoUser();
  }
}

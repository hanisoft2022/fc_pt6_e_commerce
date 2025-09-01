import 'package:domain/domain.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

abstract interface class UserRepository implements Repository {
  Future<User?> getKakaoUser();
  Future<User?> loginWithToken();
  Future<void> logout();
}

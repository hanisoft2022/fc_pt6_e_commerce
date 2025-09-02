import 'package:domain/domain.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LogoutUsecase implements RemoteUsecase<KakaoUserRepository, Result<void>> {
  LogoutUsecase();

  @override
  Future<Result<User?>> call(KakaoUserRepository repository) async {
    await repository.logout();

    return Result.success(null);
  }
}

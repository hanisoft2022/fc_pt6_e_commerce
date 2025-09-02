import 'package:domain/domain.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginUsecase implements RemoteUsecase<KakaoUserRepository, Result<User?>> {
  LoginUsecase();

  @override
  Future<Result<User?>> call(KakaoUserRepository repository) async {
    final User? result = await repository.getKakaoUser();

    return Result.success(result);
  }
}

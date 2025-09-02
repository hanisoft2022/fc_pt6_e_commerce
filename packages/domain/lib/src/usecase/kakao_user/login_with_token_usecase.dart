import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginWithTokenUsecase implements RemoteUsecase<KakaoUserRepository, Result<User?>> {
  LoginWithTokenUsecase();

  @override
  Future<Result<User?>> call(KakaoUserRepository repository) async {
    final User? user = await repository.loginWithToken();
    if (user == null) {
      return Result.failure(ErrorResponse(message: 'No User')); // 명확히 실패로 처리
    }
    return Result.success(user);
  }
}

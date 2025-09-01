import 'package:domain/domain.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginWithTokenUsecase implements RemoteUsecase<UserRepository, Result<User?>> {
  LoginWithTokenUsecase();

  @override
  Future<Result<User?>> call(UserRepository repository) async {
    final User? result = await repository.loginWithToken();

    return Result.success(result);
  }
}

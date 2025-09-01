import 'package:domain/domain.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginUsecase implements RemoteUsecase<UserRepository, Result<User?>> {
  LoginUsecase();

  @override
  Future<Result<User?>> call(UserRepository repository) async {
    final User? result = await repository.getKakaoUser();

    return Result.success(result);
  }
}

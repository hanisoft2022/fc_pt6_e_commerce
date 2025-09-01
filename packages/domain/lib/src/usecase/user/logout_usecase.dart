import 'package:domain/domain.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LogoutUsecase implements RemoteUsecase<UserRepository, Result<void>> {
  LogoutUsecase();

  @override
  Future<Result<User?>> call(UserRepository repository) async {
    await repository.logout();

    return Result.success(null);
  }
}

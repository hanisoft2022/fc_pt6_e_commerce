import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@singleton
class KakaoUserUsecase {
  final KakaoUserRepository _kakaoUserRepository;

  KakaoUserUsecase({required KakaoUserRepository userRepository})
    : _kakaoUserRepository = userRepository;

  Future<T> execute<T>({required Usecase usecase}) async {
    return await usecase(_kakaoUserRepository);
  }
}

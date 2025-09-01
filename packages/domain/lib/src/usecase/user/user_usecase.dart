import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserUsecase {
  final UserRepository _userRepository;

  UserUsecase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<T> execute<T>({required Usecase usecase}) async {
    return await usecase(_userRepository);
  }
}

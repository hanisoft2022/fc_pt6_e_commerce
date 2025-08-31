import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class UserRepositoryImpl implements Repository {
  Future<ResponseWrapper<String>> getCustomToken({required String userId, String? email});
}

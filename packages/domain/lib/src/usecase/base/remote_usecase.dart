import 'package:domain/domain.dart';

abstract interface class RemoteUsecase<T extends Repository, R> {
  Future<R> call(T repository);
}

import 'package:domain/domain.dart';

abstract interface class RemoteUsecase<T extends Repository> {
  Future call(T repository);
}

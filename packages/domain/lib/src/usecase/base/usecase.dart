import 'package:domain/domain.dart';

abstract interface class Usecase<T extends Repository, R> {
  Future<R> call(T repository);
}

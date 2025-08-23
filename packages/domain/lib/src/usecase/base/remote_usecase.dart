import 'package:domain/domain.dart';

abstract interface class RemoteUsecase<T extends Repository, R> implements Usecase<T, R> {}

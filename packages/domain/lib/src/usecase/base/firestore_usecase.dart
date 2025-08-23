import 'package:domain/domain.dart';

/// 강의에서는 LocalUsecase에 해당되나 local database 관련 패키지(isar, object_box)의 의존성 이슈로
/// 연습용인 FireStoreUsecase를 사용.
/// 실전에서는 기존의 RemoteUsecase를 사용하거나,
/// 추후 object_box 사용 시 LocalUsecase로 변경하여 사용.
abstract interface class FirestoreUsecase<T extends Repository, R> implements Usecase<T, R> {}

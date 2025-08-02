import 'package:domain/domain.dart';

class DisplayUsecase {
  final DisplayRepository _displayRepository;

  DisplayUsecase({required DisplayRepository displayRepository})
    : _displayRepository = displayRepository;

  Future execute<T>({required RemoteUsecase remoteUsecase}) async {
    return await remoteUsecase(_displayRepository);
  }
}

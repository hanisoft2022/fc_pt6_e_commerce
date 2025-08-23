import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@singleton
class DisplayUsecase {
  final DisplayRepository _displayRepository;

  DisplayUsecase({required DisplayRepository displayRepository})
    : _displayRepository = displayRepository;

  Future execute<T>({required Usecase usecase}) async {
    return await usecase(_displayRepository);
  }
}

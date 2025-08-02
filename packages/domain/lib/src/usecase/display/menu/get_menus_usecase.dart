import 'package:core/core.dart';
import 'package:domain/domain.dart';

class GetMenusUsecase implements RemoteUsecase<DisplayRepository> {
  final MallType _mallType;

  GetMenusUsecase({required MallType mallType}) : _mallType = mallType;

  @override
  Future<Result> call(DisplayRepository repository) async {
    final ApiResponse<List<Menu>> result = await repository.getMenus(mallType: _mallType);

    return result.status == 'SUCCESS'
        ? Result.success(result.data ?? [])
        : Result.error(
            ErrorResponse(status: result.status, code: result.code, message: result.message),
          );
  }
}

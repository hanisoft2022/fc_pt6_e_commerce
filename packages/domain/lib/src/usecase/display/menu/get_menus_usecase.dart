import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

class GetMenusUsecase implements RemoteUsecase<DisplayRepository, Result<List<MenuEntity>>> {
  final MallType _mallType;

  GetMenusUsecase({required MallType mallType}) : _mallType = mallType;

  @visibleForTesting
  MallType get mallType => _mallType;

  @override
  Future<Result<List<MenuEntity>>> call(DisplayRepository repository) async {
    final ApiResponse<List<MenuEntity>> result = await repository.getMenus(mallType: _mallType);

    return result.status == 'SUCCESS'
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(status: result.status, code: result.code, message: result.message),
          );
  }
}

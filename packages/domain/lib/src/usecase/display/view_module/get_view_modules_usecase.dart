import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

class GetViewModulesUsecase
    implements RemoteUsecase<DisplayRepository, Result<List<ViewModuleEntity>>> {
  final int _tabId;
  final int page;

  GetViewModulesUsecase({required int tabId, required this.page}) : _tabId = tabId;

  @visibleForTesting
  int get tabId => _tabId;

  @override
  Future<Result<List<ViewModuleEntity>>> call(DisplayRepository repository) async {
    final ApiResponse<List<ViewModuleEntity>> result = await repository.getViewModules(
      tabId: _tabId,
      page: page,
    );

    return result.status == 'SUCCESS'
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(status: result.status, code: result.code, message: result.message),
          );
  }
}

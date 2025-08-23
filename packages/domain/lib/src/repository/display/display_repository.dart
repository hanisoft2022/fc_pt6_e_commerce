import 'package:core/core.dart';
import 'package:domain/domain.dart';

abstract interface class DisplayRepository implements Repository {
  Future<ApiResponse<List<MenuEntity>>> getMenus({required MallType mallType});
  Future<ApiResponse<List<ViewModuleEntity>>> getViewModules({
    required int tabId,
    required int page,
  });
}

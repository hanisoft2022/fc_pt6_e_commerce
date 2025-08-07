import 'package:core/core.dart';
import 'package:domain/domain.dart';

abstract interface class DisplayRepository implements Repository {
  Future<ApiResponse<List<Menu>>> getMenus({required MallType mallType});
  Future<ApiResponse<List<ViewModule>>> getViewModules({required int tabId, required int page});
}

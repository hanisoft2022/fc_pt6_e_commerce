import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DisplayRepository)
class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _displayApi;

  DisplayRepositoryImpl({required DisplayApi displayApi}) : _displayApi = displayApi;

  @override
  Future<ResponseWrapper<List<Menu>>> getMenus({required MallType mallType}) async {
    final ResponseWrapper<List<MenuDto>> response = await _displayApi.getMenus(mallType.name);

    return response.toEntity<List<Menu>>(response.data?.map((e) => e.toEntity()).toList() ?? []);
  }

  @override
  Future<ApiResponse<List<ViewModule>>> getViewModules({
    required int tabId,
    required int page,
  }) async {
    final ResponseWrapper<List<ViewModuleDto>> response = await _displayApi.getViewModulues(
      tabId,
      page,
    );

    return response.toEntity<List<ViewModule>>(
      response.data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

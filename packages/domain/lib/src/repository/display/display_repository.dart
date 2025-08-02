import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/repository/repository.dart';

abstract interface class DisplayRepository implements Repository {
  Future<List<Menu>> getMenus({required MallType mallType});
}

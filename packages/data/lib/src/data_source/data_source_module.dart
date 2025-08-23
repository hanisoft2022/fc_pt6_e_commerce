import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataSourceModule {
  @singleton
  DisplayApi get displayApi => DisplayMockApi();

  @singleton
  DisplayDao get displayDao => DisplayDao();
}

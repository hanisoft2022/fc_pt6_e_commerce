import 'dart:io';

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:core/core.dart';

@module
abstract class DataSourceModule {
  final Dio _dio = RestClient().getDio;

  @singleton
  DisplayApi get displayApi {
    // return DisplayMockApi();
    String baseUrl = Platform.isAndroid ? 'http://10.0.2.2:8080' : 'http://localhost:8080';

    _dio.options.baseUrl = baseUrl;

    return DisplayApi(_dio);
  }

  @singleton
  DisplayDao get displayDao => DisplayDao(displayApi);
}

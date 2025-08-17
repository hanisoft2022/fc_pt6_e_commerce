import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_module.freezed.dart';

@freezed
abstract class ViewModule with _$ViewModule {
  factory ViewModule({
    required String type,
    required String title,
    required String subtitle,
    required String imageUrl,
    required int time,
    required List<ProductInfo> products,
    required List<String> tabs,
  }) = _ViewModule;
}

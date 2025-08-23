import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_module_entity.freezed.dart';

@freezed
abstract class ViewModuleEntity with _$ViewModuleEntity {
  factory ViewModuleEntity({
    required String type,
    required String title,
    required String subtitle,
    required String imageUrl,
    required int time,
    required List<ProductInfoEntity> products,
    required List<String> tabs,
  }) = _ViewModuleEntity;
}

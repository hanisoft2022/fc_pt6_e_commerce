import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_entity.freezed.dart';

@freezed
abstract class MenuEntity with _$MenuEntity {
  factory MenuEntity({required int tabId, required String title}) = _MenuEntity;
}

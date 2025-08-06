import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';

@freezed
abstract class Menu with _$Menu {
  factory Menu({required int tabId, required String title}) = _Menu;
}

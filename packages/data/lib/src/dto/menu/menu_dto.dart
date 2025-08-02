import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_dto.freezed.dart';
part 'menu_dto.g.dart';

@freezed
abstract class MenuDto with _$MenuDto {
  factory MenuDto({@Default(-1) int? tabId, @Default('') String? title}) = _MenuDto;

  factory MenuDto.fromJson(Map<String, dynamic> json) => _$MenuDtoFromJson(json);
}

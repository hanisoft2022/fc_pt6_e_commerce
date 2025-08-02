import 'package:data/data.dart';
import 'package:domain/domain.dart';

extension MenuX on MenuDto {
  Menu toEntity() {
    return Menu(tabId: tabId ?? 0, title: title ?? '');
  }
}

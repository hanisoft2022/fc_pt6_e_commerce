import 'package:data/data.dart';
import 'package:domain/domain.dart';

extension MenuX on MenuDto {
  Menu toEntity() {
    return Menu(tabId: tabId, title: title);
  }
}

extension ViewModuleX on ViewModuleDto {
  ViewModule toEntity() {
    return ViewModule(type: type, title: title, subtitle: subtitle, imageUrl: imageUrl);
  }
}

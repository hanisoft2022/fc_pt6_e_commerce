// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_module_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewModuleDto _$ViewModuleDtoFromJson(Map<String, dynamic> json) =>
    _ViewModuleDto(
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => ProductInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductInfoDto>[],
    );

Map<String, dynamic> _$ViewModuleDtoToJson(_ViewModuleDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'products': instance.products,
    };

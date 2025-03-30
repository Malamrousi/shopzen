// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponse _$GetAllCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesResponse(
      data: json['data'] == null
          ? null
          : GetAllCategories.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllCategoriesResponseToJson(
        GetAllCategoriesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllCategories _$GetAllCategoriesFromJson(Map<String, dynamic> json) =>
    GetAllCategories(
      categories: (json['categories'] as List<dynamic>?)
          ?.map(
              (e) => GetAllCategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCategoriesToJson(GetAllCategories instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

GetAllCategoriesModel _$GetAllCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$GetAllCategoriesModelToJson(
        GetAllCategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

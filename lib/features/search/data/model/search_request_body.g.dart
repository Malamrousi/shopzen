// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequestBody _$SearchRequestBodyFromJson(Map<String, dynamic> json) =>
    SearchRequestBody(
      searchProductName: json['searchProductName'] as String?,
      priceMin: (json['priceMin'] as num?)?.toInt(),
      priceMax: (json['priceMax'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchRequestBodyToJson(SearchRequestBody instance) =>
    <String, dynamic>{
      'searchProductName': instance.searchProductName,
      'priceMin': instance.priceMin,
      'priceMax': instance.priceMax,
    };

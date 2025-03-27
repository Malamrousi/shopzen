  import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_product.g.dart';

@JsonSerializable()
class GetAllProductResponse {
  GetAllProductResponse(this.data);

  factory GetAllProductResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductResponseFromJson(json);

  final ProductGetAllData data;

  List<GetAllProductModel> get productGetAllList {
    if (data.productsLsit.isEmpty) {
      return [];
    }
    return data.productsLsit;
  }
}

@JsonSerializable()
class ProductGetAllData {
  ProductGetAllData(this.productsLsit);

  factory ProductGetAllData.fromJson(Map<String, dynamic> json) =>
      _$ProductGetAllDataFromJson(json);

  @JsonKey(name: 'products')
  final List<GetAllProductModel> productsLsit;
}

@JsonSerializable()
class GetAllProductModel {
  GetAllProductModel(
    this.id,
    this.title,
    this.price,
    this.images,
    this.description,
    this.category,
  );

  factory GetAllProductModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductModelFromJson(json);

  final String? id;
  final String? title;
  final double? price;
  final List<String>? images;
  final String? description;
  final CategoryProductModel? category;
}

@JsonSerializable()
class CategoryProductModel {
  CategoryProductModel(this.id, this.name);

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);

  final String? id;
  final String? name;
}
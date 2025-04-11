// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  final ProductDetailsData data;

  ProductDetailsResponse({required this.data});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json); 
}

@JsonSerializable()
class ProductDetailsData {
  @JsonKey(name: 'product')
    final ProductDetailsModel productDetailsModel;

  ProductDetailsData({required this.productDetailsModel});

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataFromJson(json);

}
@JsonSerializable()

class ProductDetailsModel {

  final String? title;
  final double? price;
  final List<String> images;
  final String? description;
  final String? id;
  ProductDetailsModel(this.id, {
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

}

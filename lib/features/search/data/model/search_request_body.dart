import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_request_body.g.dart';
@JsonSerializable()
class SearchRequestBody {
  final String? searchProductName;
  final int? priceMin;
  final int? priceMax;
  SearchRequestBody({
    this.searchProductName,
    this.priceMin,
    this.priceMax,
  });



  Map<String, dynamic> toJson() => _$SearchRequestBodyToJson(this);
}

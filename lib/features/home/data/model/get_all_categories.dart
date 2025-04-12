import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_categories.g.dart';
@JsonSerializable()
class GetAllCategoriesResponse {
  final GetAllCategories? data;
  GetAllCategoriesResponse({this.data});

  factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) => _$GetAllCategoriesResponseFromJson(json);

  List <GetAllCategoriesModel>? get categoriesList {
   if(data!.categories!.isEmpty){
    return [];
   }
   return data!.categories;
  }
}

@JsonSerializable()
class GetAllCategories {
  final List<GetAllCategoriesModel>? categories;
  GetAllCategories({this.categories});
  factory GetAllCategories.fromJson(Map<String, dynamic> json) => _$GetAllCategoriesFromJson(json);
}

@JsonSerializable()
class GetAllCategoriesModel {
  final String? id;
  final String? name;
  final String? image;


  GetAllCategoriesModel({this.id, this.name, this.image});
  factory GetAllCategoriesModel.fromJson(Map<String, dynamic> json) => _$GetAllCategoriesModelFromJson(json);
}
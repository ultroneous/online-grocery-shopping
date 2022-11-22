import 'package:json_annotation/json_annotation.dart';
part 'parentcategoryid.g.dart';

@JsonSerializable()
class ParentCategoryId {
  String? id;
  String? name;
  List<String>? image;
  bool? isActive;
  int? v;
  ParentCategoryId({
    this.id,
    this.name,
    this.image,
    this.isActive,
    this.v,
  });

  factory ParentCategoryId.fromJson(Map<String, dynamic> json) =>
      _$ParentCategoryIdFromJson(json);
  Map<String, dynamic> toJson() => _$ParentCategoryIdToJson(this);
}

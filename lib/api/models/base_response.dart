// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse {
  String status = "false";
  String message = "Something went wrong!";
  String token = "df";
}

class BaseResponseCategories {
  String status = "false";
  String message = "Something went wrong!";
}

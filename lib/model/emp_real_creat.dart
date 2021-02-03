
import 'package:api_parsing/model/emp_create.dart';

class EmpRealCreate{
  String status;
  String message;
  EmpCreate data;

  EmpRealCreate.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = EmpCreate.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
    "status" : status,
    "message" : message,
    "data" : data.toJson(),
  };
}
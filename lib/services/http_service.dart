import 'dart:convert';

import 'package:api_parsing/model/empList_model.dart';
import 'package:api_parsing/model/empOne_model.dart';
import 'package:api_parsing/model/emp_create.dart';
import 'package:api_parsing/model/emp_delete.dart';
import 'package:api_parsing/model/emp_real_creat.dart';
import 'package:http/http.dart';

class NW{

    static String BASE = "dummy.restapiexample.com";
    static Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

  /*Http APIs*/

  static String API_EMP_LIST = "/api/v1/employees";
  static String API_EMP_ONE = "/api/v1/employee/"; //{id}
  static String API_EMP_CREATE = "/api/v1/create";
  static String API_EMP_UPDATE='/api/v1/update/';//{{id}}
  static String API_EMP_DELETE = "/api/v1/delete/"; //{id}


  /*Http Requests*/

  static Future<String> GET(String api, Map<String, String> params) async{
    print(api);
    var uri =Uri.https(BASE, api, params);
    var response =await get(uri, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  /*POST*/
  static Future<String> POST(String api, Map<String, String> params) async{
    var uri = Uri.https(BASE,api);
    var response = await post(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    return null;
  }

    /*PUT*/
    static Future<String> PUT(String api, Map<String, String> params) async{
      var uri = Uri.https(BASE, api);
      var response = await put(uri, headers: headers);
      if(response.statusCode == 200){
        return response.body;
      }
      return null;
    }

    /*DELETE*/
    static Future<String> DEL(String api, Map<String, String> params) async{
      var uri = Uri.https(BASE, api, params);
      var response = await delete(uri, headers: headers);
      if(response.statusCode == 200){
        return response.body;
      }
      return null;
    }

  /*Http params*/

  static Map<String, String> paramEmpty(){
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramEmpCreate(EmpCreate empCreate){
    Map<String, String> params = new Map();
    params.addAll({
      "name" : empCreate.name,
      "salary" : empCreate.salary.toString(),
      "age" : empCreate.age.toString(),
    });
    return params;
  }


  /*Http Parsing*/

  static EmpList parseEmpList(String body){
    dynamic json =jsonDecode(body);
    var data =EmpList.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String body){
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

    static EmpRealCreate parseEmpCreate(String body){
      dynamic json = jsonDecode(body);
      var data = EmpRealCreate.fromJson(json);
      return data;
    }

    static EmpList parseUpdate(String body){
      dynamic json =jsonDecode(body);
      var data =EmpList.fromJson(json);
      return data;
    }

    static EmpDelete parseDelete(String body){
      dynamic json = jsonDecode(body);
      var data = EmpDelete.fromJson(json);
      return data;
    }

}


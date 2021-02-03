import 'package:api_parsing/model/empList_model.dart';
import 'package:api_parsing/model/emp_model.dart';
import 'package:api_parsing/services/http_service.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  static final String id = "update_page";
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  List<Employee> list =new List();
  String status, message;

  void _apiUpdate(int id){
    NW.PUT(NW.API_EMP_UPDATE+id.toString(), NW.paramEmpty()).then((response) => {
      _showResponse(response),
      print(response),
    });
  }

  void _showResponse(String response){
    EmpList emplist =NW.parseUpdate(response);
    setState(() {
      list = emplist.data;
      status = emplist.status;
      message = emplist.message;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiUpdate(14);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("status: $status", style: TextStyle(fontSize: 32),),
              Text("data: $list", style: TextStyle(fontSize: 28),),
              Text("message: $message", style: TextStyle(fontSize: 28),),
            ],
          ),
        ),
      ),
    );
  }
}

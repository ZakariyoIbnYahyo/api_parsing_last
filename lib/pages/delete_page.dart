import 'package:api_parsing/model/emp_delete.dart';
import 'package:api_parsing/services/http_service.dart';
import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {

  static final String id = "delete_page";

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {

  String data, status, message;

  void _apiEmpDel(int i){
    NW.DEL(NW.API_EMP_DELETE + i.toString(), NW.paramEmpty()).then((response) =>{
      _showResponse(response),
      print(response),
    });
  }

  void _showResponse(String response){
    EmpDelete empDelete =NW.parseDelete(response);
    setState(() {
      status = empDelete.status;
      data = empDelete.data;
      message = empDelete.message;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _apiEmpDel(4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Status: $status", style: TextStyle(fontSize: 24),),
            Text("Data: $data", style: TextStyle(fontSize: 24),),
            Text("Message: $message", style: TextStyle(fontSize: 24),),
          ],
        ),
      ),
    );
  }
}

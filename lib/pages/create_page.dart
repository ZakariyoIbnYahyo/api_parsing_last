import 'package:api_parsing/model/emp_create.dart';
import 'package:api_parsing/model/emp_real_creat.dart';
import 'package:api_parsing/services/http_service.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  static final String id = "create_page";
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  EmpCreate infos;
  String status, message;
  String name;
  int age,salary;

  void _apiEmpCreate(EmpCreate empCreat){
    NW.POST(NW.API_EMP_CREATE, NW.paramEmpCreate(empCreat)).then((response) =>{
      _showResponse(response),
      print(response),
    });
  }

  void  _showResponse(String response){
    EmpRealCreate empRealCreate = NW.parseEmpCreate(response);
    setState(() {
      infos = empRealCreate.data;
      status = empRealCreate.status;
      message = empRealCreate.message;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var empC = new EmpCreate(id: 2, name: "test", salary: "5000", age: "28" );
    _apiEmpCreate(empC);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("Status: $status", style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              Text("ID: " + infos.id.toString(), style: TextStyle(fontSize: 24),),
              SizedBox(height: 10,),
              Text(infos.name+"("+infos.age.toString()+")",style: TextStyle(color: Colors.black,fontSize: 24),),
              SizedBox(height: 10,),
              Text(infos.salary.toString()+"\$",style: TextStyle(color: Colors.black,fontSize: 22),),
              SizedBox(height: 10,),
              Text("Message: $message", style: TextStyle(fontSize: 16),),
            ],
          ),
        ),
      )
    );;
  }
}

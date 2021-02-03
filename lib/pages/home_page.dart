

import 'package:api_parsing/model/empList_model.dart';
import 'package:api_parsing/model/emp_model.dart';
import 'package:api_parsing/pages/detail_page.dart';
import 'package:api_parsing/pages/update_page.dart';
import 'package:api_parsing/services/http_service.dart';
import 'package:flutter/material.dart';

import 'create_page.dart';
import 'delete_page.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Employee> infos = new List();

  void _apiEmpList(){
  NW.GET(NW.API_EMP_LIST, NW.paramEmpty()).then((response) => {
    print(response),
    _showResponse(response),
  });
  }

  void _showResponse(String response){
    EmpList empList =NW.parseEmpList(response);
    setState(() {
      infos = empList.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _apiEmpList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Employee List"),
        ),
        body: Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 5,right: 5),
                        child: FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context, CreatePage.id);
                          },
                          color: Colors.redAccent,
                          child: Text("Create", style: TextStyle(color: Colors.white),),
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 5,right: 5),
                        child: FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context, UpdatePage.id);
                          },
                          color: Colors.green,
                          child: Text("Update", style: TextStyle(color: Colors.white),),
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 5,right: 5),
                        child: FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context, DeletePage.id);
                          },
                          color: Colors.black,
                          child: Text("Delete", style: TextStyle(color: Colors.white),),
                        ),
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: infos.length,
                itemBuilder: (ctx, index) {
                  return itemOfList(infos[index]);
                },
              ),
            ),
          ],
        )
    );
  }

  Widget itemOfList(Employee emp) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder:(context)=>DetailPage(emp.id))
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(emp.employee_name+"("+emp.employee_age.toString()+")",style: TextStyle(color: Colors.black,fontSize: 20),),
              SizedBox(height: 10,),
              Text(emp.employee_salary.toString()+"\$",style: TextStyle(color: Colors.black,fontSize: 18),),
            ],
          ),
        )
    );
  }

}


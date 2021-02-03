import 'package:api_parsing/model/empOne_model.dart';
import 'package:api_parsing/model/emp_model.dart';
import 'package:api_parsing/services/http_service.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static final String id = "detail_page";

  int epm_id;
  DetailPage(this.epm_id);

  @override
  State<StatefulWidget> createState()  {
    return _DetailPageState(this.epm_id);
  }
  // _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int emp_id;
  _DetailPageState(this.emp_id);

  Employee emp;

void _apiEmpOne(int id){
  NW.GET(NW.API_EMP_ONE + id.toString(), NW.paramEmpty()).then((response) =>{
    print(response),
    _showResponse(response),
  });
}

void _showResponse(String response){
  EmpOne empOne =NW.parseEmpOne(response);
  setState(() {
    emp = empOne.data;
  });
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpOne(emp_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 1),
            child:  Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(emp.employee_name+"("+emp.employee_age.toString()+")",style: TextStyle(color: Colors.black,fontSize: 20),),
                  SizedBox(height: 10,),
                  Text(emp.employee_salary.toString()+"\$",style: TextStyle(color: Colors.black,fontSize: 18),),
                ],
              ),
            )
        )
    );
  }
}

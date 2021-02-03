class EmpDelete{
  String status;
  String data;
  String message;

  EmpDelete({this.status, this.data, this.message});

  EmpDelete.fromJson(Map<String,dynamic> json):
        status=json['status'],
        data=json['data'],
        message=json['message'];
  Map<String,dynamic> toJson(){
    return {
      'status':status,
      'data':data,
      'message':message,
    };
  }
}
class EmpCreate{
  int id;
  String name;
  String salary;
  String age;

  EmpCreate({this.id, this.name, this.salary, this.age});

  EmpCreate.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    salary = json['salary'],
    age = json['age'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'salary': salary,
    'age': age,
   };
  }

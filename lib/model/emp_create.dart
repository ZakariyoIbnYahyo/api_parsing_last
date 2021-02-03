class EmpCreate{
  int id;
  String name;
  int salary;
  int age;

  EmpCreate({this.id, this.name, this.salary, this.age});

  EmpCreate.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    salary = json['salary'],
    age = json['age'];

  Map<String, dynamic> toJson() => {
    'id': id.toString(),
    'name': name,
    'salary': salary.toString(),
    'age': age.toString(),
   };
  }

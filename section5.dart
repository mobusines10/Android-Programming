// Abstract Class Skills

abstract class Skills {
  void programming();
  void communication();
}

// Class Person

class Person {
  String name;
  int _age; // private for getter/setter
  static String universityName = "Sohag University";

  Person(this.name, this._age);

  // Getter
  int get age => _age;

  // Setter
  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print("Age must be positive!");
    }
  }
}

// Class Employee extends Person

class Employee extends Person {
  double salary;

  Employee(String name, int age, this.salary) : super(name, age);

  void showInfo() {
    print("Name   : $name");
    print("Age    : $age");
    print("Salary : \$$salary");
  }
}

// Class Developer extends Employee implements Skills

class Developer extends Employee implements Skills {
  String language;

  Developer(String name, int age, double salary, String language)
      : this.language = language,   // using "this"
        super(name, age, salary);

  @override
  void showInfo() {
    super.showInfo();
    print("Language: $language");
  }

  @override
  void programming() {
    print("$name is writing code in $language 💻");
  }

  @override
  void communication() {
    print("$name is communicating effectively with the team 🗣️");
  }
}

// Main

void main() {
  Developer dev = Developer("Mohamed", 22, 8500, "Dart");

  print("=============================");
  print("   University: ${Person.universityName}");
  print("=============================");

  dev.showInfo();

  print("-----------------------------");
  dev.programming();
  dev.communication();
  print("=============================");
}

//output
/*
=============================
   University: Sohag University
=============================
Name   : Mohamed
Age    : 22
Salary : $8500.0
Language: Dart
-----------------------------
Mohamed is writing code in Dart 💻
Mohamed is communicating effectively with the team 🗣️
=============================
*/
// Part 1: Manage Student Names
Set<String> students = {};

void addStudent(String name) {
  students.add(name);
}

void printStudentsRecursive(List<String> list, int index) {
  if (index >= list.length) return;
  print(list[index]);
  printStudentsRecursive(list, index + 1);
}

// Part 2: Manage Student Courses

Map<String, Map<String, double>> studentCourses = {};

void addCourse(String studentName, String courseName, [double grade = 0]) {
  if (!studentCourses.containsKey(studentName)) {
    studentCourses[studentName] = {};
  }
  studentCourses[studentName]![courseName] = grade;
}

double averageGrade(String studentName) {
  if (!studentCourses.containsKey(studentName)) return 0;

  final grades = studentCourses[studentName]!.values.toList();
  final total = grades.fold<double>(0, (sum, grade) => sum + grade);
  return total / grades.length;
}
// Main
void main() {
  //Part 1

  addStudent("Ali");
  addStudent("Sara");
  addStudent("Mohamed");
  addStudent("Ali"); // duplicate, won't be added

  print("=== Students (Recursive) ===");
  printStudentsRecursive(students.toList(), 0);

  print("\n=== Students (Lambda + forEach) ===");
  students.forEach((name) => print(name));

  // Spread operator to merge two sets
  Set<String> newStudents = {"Nour", "Omar", "Sara"}; // Sara is duplicate
  Set<String> allStudents = {...students, ...newStudents};

  print("\n=== All Students After Merge ===");
  allStudents.forEach((name) => print(name));

  // Part 2

  addCourse("Ali", "Math", 90);
  addCourse("Ali", "Science", 85);
  addCourse("Ali", "English"); // grade defaults to 0
  addCourse("Sara", "Math", 78);
  addCourse("Sara", "Science", 92);
  addCourse("Mohamed", "Math", 88);
  addCourse("Mohamed", "English", 76);

  print("\n=== Average Grades ===");
  ["Ali", "Sara", "Mohamed"].forEach((name) {
    print("$name: ${averageGrade(name).toStringAsFixed(2)}");
  });

  print("\n=== Full Course Details ===");
  studentCourses.forEach((student, courses) {
    print("$student:");
    courses.forEach((course, grade) => print("  $course -> $grade"));
  });
}
//The output
/*
=== Students (Recursive) ===
Ali
Sara
Mohamed

=== Students (Lambda + forEach) ===
Ali
Sara
Mohamed

=== All Students After Merge ===
Ali
Sara
Mohamed
Nour
Omar

=== Average Grades ===
Ali: 58.33
Sara: 85.00
Mohamed: 82.00

=== Full Course Details ===
Ali:
  Math -> 90.0
  Science -> 85.0
  English -> 0.0
Sara:
  Math -> 78.0
  Science -> 92.0
Mohamed:
  Math -> 88.0
  English -> 76.0
 */
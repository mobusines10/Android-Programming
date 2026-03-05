import 'dart:io';
import 'dart:math';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  // Input number of students
  int numStudents = 0;
  while (true) {
    stdout.write('Enter number of students: ');
    try {
      numStudents = int.parse(stdin.readLineSync()!);
      if (numStudents > 0) break;
      print('Please enter a positive number.');
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
    }
  }

  // Collect student data
  for (int i = 0; i < numStudents; i++) {
    stdout.write('Enter name for student ${i + 1}: ');
    String name = stdin.readLineSync()!.trim();
    studentNames.add(name);

    int numSubjects = 0;
    while (true) {
      stdout.write('Enter number of subjects for $name: ');
      try {
        numSubjects = int.parse(stdin.readLineSync()!);
        if (numSubjects > 0) break;
        print('Please enter a positive number.');
      } catch (e) {
        print('Invalid input. Please enter a valid number.');
      }
    }

    List<double> grades = [];
    for (int j = 0; j < numSubjects; j++) {
      while (true) {
        stdout.write('Enter grade ${j + 1} for $name: ');
        try {
          double grade = double.parse(stdin.readLineSync()!);
          if (grade >= 0 && grade <= 100) {
            grades.add(grade);
            break;
          }
          print('Grade must be between 0 and 100.');
        } catch (e) {
          print('Invalid input. Please enter a valid grade.');
        }
      }
    }
    studentGrades.add(grades);
  }

  // Helper: get letter grade
  String getLetterGrade(double avg) {
    if (avg >= 90) return 'A';
    if (avg >= 80) return 'B';
    if (avg >= 70) return 'C';
    return 'F';
  }

  // Helper: calculate average
  double getAverage(List<double> grades) {
    return grades.reduce((a, b) => a + b) / grades.length;
  }

  // Menu loop
  while (true) {
    print('\n--- Menu ---');
    print('1 - Show All Results');
    print('2 - Search Student');
    print('3 - Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('\n--- All Results ---');
        for (int i = 0; i < studentNames.length; i++) {
          double avg = getAverage(studentGrades[i]);
          double rounded = double.parse(avg.toStringAsFixed(2));
          String letter = getLetterGrade(avg);
          print('${studentNames[i].toUpperCase()} | Average: $rounded | Grade: $letter');
        }
        break;

      case '2':
        stdout.write('Enter student name to search: ');
        String searchName = stdin.readLineSync()!.trim().toLowerCase();
        int index = studentNames.indexWhere(
          (name) => name.toLowerCase() == searchName,
        );
        if (index != -1) {
          double avg = getAverage(studentGrades[index]);
          print('${studentNames[index]} - Average: ${avg.round()}');
        } else {
          print('Student not found.');
        }
        break;

      case '3':
        print('Goodbye!');
        return;

      default:
        print('Invalid option. Please choose 1, 2, or 3.');
    }
  }
}
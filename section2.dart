import 'dart:math';

void main() {
  // Generate random degree 0-100
  Random random = Random();
  int degree = random.nextInt(101);

  print('Degree: $degree');

  // Convert to grade using switch
  String grade;
  int gradeGroup = degree ~/ 10;

  switch (gradeGroup) {
    case 10:
    case 9:
      grade = 'A';
      break;
    case 8:
      grade = 'B';
      break;
    case 7:
      grade = 'C';
      break;
    case 6:
      grade = 'D';
      break;
    default:
      grade = 'F';
  }

  print('Grade: $grade');
}
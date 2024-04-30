library birth_day_type_calculator;
import 'dart:core';
// ignore: constant_identifier_names
enum BirthDayType { NEAREST, NEXT, LAST }
class BirthDayTypeCalculator {
  int calculateAge(DateTime dob, String type) {
    DateTime currentDate = DateTime.now();
    
    int age = currentDate.year - dob.year;
    if (type == BirthDayType.NEAREST.name) {
      age = calculateAgeForNearestBirthDay(age, dob, currentDate);
    } else if (type == BirthDayType.NEXT.name) {
      age = calculateAgeForNextBirthDay(age, dob, currentDate);
    } else if (type == BirthDayType.LAST.name) {
      age = calculateAgeForLastBirthDay(age, dob, currentDate);
    }
    age = ensureNonNegativeAge(age);
    return age;
  }

  int calculateAgeForNearestBirthDay(
      int age, DateTime dob, DateTime currentDate) {
    if (currentDate.month >= 6 && currentDate.year == dob.year) {
      age += 1;
    } else if (currentDate.month >= 6) {
      age += 1;
    } else if (currentDate.month < 6 &&
        currentDate.month != 5 &&
        currentDate.year == dob.year) {
      // Do nothing, age remains the same
    } else if (currentDate.month == 5 && currentDate.day >= 30) {
      age += 1;
    } else if (currentDate.month == 5 && currentDate.day <= 30) {
      // Do nothing, age remains the same
    } else if (currentDate.month == dob.month &&
        currentDate.year == dob.year &&
        currentDate.day > dob.day) {
      age += 1;
    }
    return age;
  }

  int calculateAgeForNextBirthDay(int age, DateTime dob, DateTime currentDate) {
    if (currentDate.month != dob.month || currentDate.day != dob.day) {
      age += 1;
    }

    return age;
  }

  int calculateAgeForLastBirthDay(int age, DateTime dob, DateTime currentDate) {
    age = currentDate.year - dob.year - 1;

    if (currentDate.month == dob.month && currentDate.day >= dob.day) {
      age += 1;
    } else if (currentDate.month > dob.month) {
      age += 1;
    }

    return age;
  }

  int ensureNonNegativeAge(int age) {
    return age < 0 ? 0 : age;
  }
}

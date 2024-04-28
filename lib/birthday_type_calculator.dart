library birth_day_type_calculator;
import 'dart:core';

import 'package:birthday_type_calculator/age_calculator.dart';

enum BirthDayType { NEAREST, NEXT, LAST}


class BirthDayTypeCalculator {
  int calculateAge(DateTime dob, String type) {
    DateTime currentDate = DateTime.now();
    DateDuration duration = AgeCalculator.age(dob, today: currentDate);
    int age = duration.years;
    int days = duration.days;
    int months = duration.months;
    if (type == BirthDayType.NEAREST.name) {
      age = calculateAgeForNearestBirthDay(age, duration, dob, currentDate);
    } else if (type == BirthDayType.NEXT.name) {
      age = calculateAgeForNextBirthDay(age, duration, dob, currentDate);
    } else if (type == BirthDayType.LAST.name) {
      age = calculateAgeForLastBirthDay(age, duration, dob, currentDate);
    }
    age = ensureNonNegativeAge(age);
    return age;
  }

  int calculateAgeForNearestBirthDay(
      int age, DateDuration duration, DateTime dob, DateTime currentDate) {
    // currentDate = DateTime.parse('2023-07-01');
    if (duration.months >= 6 && currentDate.year == dob.year) {
      age += 1;
    } else if (duration.months >= 6) {
      age += 1;
    } else if (duration.months < 6 &&
        duration.months != 5 &&
        currentDate.year == dob.year) {
      // Do nothing, age remains the same
    } else if (duration.months == 5 && duration.days > 30) {
      age += 1;
    } else if (duration.months == 5 && duration.days <= 30) {
      // Do nothing, age remains the same
    } else if (duration.months == dob.month &&
        currentDate.year == dob.year &&
        duration.days > dob.day) {
      age += 1;
    }
    return age;
  }

  int calculateAgeForNextBirthDay(
      int age, DateDuration duration, DateTime dob, DateTime currDate) {
    if (duration.months != dob.month || duration.days != dob.day) {
      age += 1;
    }

    return age;
  }

  int calculateAgeForLastBirthDay(
      int age, DateDuration duration, DateTime dob, DateTime currDate) {
    age = currDate.year - dob.year - 1;

    if (duration.months == dob.month && duration.days >=dob.day) {
      age += 1;
    } else if (duration.months > dob.month) {
      age += 1;
    }

    return age;
  }

  int ensureNonNegativeAge(int age) {
    return age < 0 ? 0 : age;
  }
}

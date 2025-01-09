library birth_day_type_calculator;

import 'dart:core';

import 'age_calculator.dart';

// ignore: constant_identifier_names
enum BirthDayType { NEAREST, NEXT, LAST }

class BirthDayTypeCalculator {
  int calculateAge(DateTime dob, String type) {
    DateTime currentDate = DateTime.now();
    int age = 0;
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
    DateDuration duration = AgeCalculator.age(dob, today: currentDate);
    age = duration.years;
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

  int calculateAgeForNextBirthDay(int age, DateTime dob, DateTime currDate) {
    DateDuration duration = AgeCalculator.age(dob, today: currDate);
    age = duration.years;
    if (duration.months != dob.month || duration.days != dob.day) {
      age += 1;
    }

    return age;
  }
  // int calculateAgeForNextBirthDay(int age, DateTime dob, DateTime currentDate) {
  //   DateDuration duration = AgeCalculator.age(dob, today: currentDate);
  //   age = duration.years;
  //   if (currentDate.month == dob.month && currentDate.day == dob.day) {
  //     age ++;
  //   }
  //     if (duration.months >= 6 || currentDate.year == dob.year) {
  //     age++;
  //   }

  //   // if (duration.months >= 6 || currentDate.year == dob.year) {
  //   //   age ++;
  //   // } else if (currentDate.month == 5 &&
  //   //     currentDate.year == dob.year &&
  //   //     currentDate.day >= 31) {
  //   //   age++;
  //   // }
  //   return age;
  // }

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

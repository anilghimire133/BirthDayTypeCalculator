import 'package:nepali_utils/nepali_utils.dart';

class DateConverter {
  DateTime getDateOneYearAgo(DateTime todayDate) {
    final oneYearAgo = todayDate.subtract(const Duration(days: 365));
    return oneYearAgo;
  }

  DateTime convertBSToAD(String date) {
    List<String> dateParts = date.split('-');
    int year = int.tryParse(dateParts[0])!;
    int month = int.tryParse(dateParts[1])!;
    int day = int.tryParse(dateParts[2])!;
    NepaliDateTime nepaliDate = NepaliDateTime(year, month, day);
    var formattedDate = nepaliDate.toDateTime();
    return formattedDate;
  }

  String convertADToBS(String date) {
    List<String> dateParts = date.split('-');

    int year = int.tryParse(dateParts[0])!;
    int month = int.tryParse(dateParts[1])!;
    int day = int.tryParse(dateParts[2])!;
    DateTime dateTime = DateTime(year, month, day);
    NepaliDateTime nepaliDate =
    DateTime(dateTime.year, dateTime.month, dateTime.day)
        .toNepaliDateTime();
    String formattedDate = NepaliDateFormat('yyyy-MM-dd').format(nepaliDate);
    return formattedDate;
  }
}

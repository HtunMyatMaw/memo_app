class DateUtility {
  List<String> weekDayText = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  List<String> monthText = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  /// Get HH:MM from DateTime
  String getTimeHHMMSS(DateTime dateTime) {
    String hour = dateTime.hour < 10 ? '0${dateTime.hour}' : '${dateTime.hour}';
    String minute =
        dateTime.minute < 10 ? '0${dateTime.minute}' : '${dateTime.minute}';
    String second =
        dateTime.second < 10 ? '0${dateTime.second}' : '${dateTime.second}';

    return hour + minute + second;
  }

  String formatStringHHMM(int hour, int minute) {
    String hourStr = hour < 10 ? '0$hour' : '$hour';
    String minuteStr = minute < 10 ? '0$minute' : '$minute';

    return hourStr + ' : ' + minuteStr;
  }

  String formattedCurrentTimeHHMM() {
    var date = DateTime.now();
    String hourStr = date.hour < 10 ? '0${date.hour}' : '${date.hour}';
    String minuteStr = date.minute < 10 ? '0${date.minute}' : '${date.minute}';

    return hourStr + ' : ' + minuteStr;
  }

  /// yyyyMMddHHmmss
  String formattedNowDate() {
    var nowDate = DateTime.now();
    String formatDate =
        '${nowDate.year}${nowDate.month}${nowDate.day}${getTimeHHMMSS(nowDate)}';

    return formatDate;
  }

  /// weekday, month day
  String formatHomePageDate() {
    var nowDate = DateTime.now();
    String weekDayName = weekDayText[nowDate.weekday - 1];
    String monthName = monthText[nowDate.month - 1];
    return '$weekDayName, $monthName ${nowDate.day}';
  }
}

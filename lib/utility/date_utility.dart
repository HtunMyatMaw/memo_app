class DateUtility {
  /// Get HH:MM from DateTime
  String getTimeHHMM(DateTime dateTime) {
    String hour = dateTime.hour < 10
        ? '0' + dateTime.hour.toString()
        : dateTime.hour.toString();
    String minute = dateTime.minute < 10
        ? '0' + dateTime.minute.toString()
        : dateTime.minute.toString();

    return hour + ':' + minute;
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
}

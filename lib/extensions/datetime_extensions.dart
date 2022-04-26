extension StringDates on DateTime {
  String get fullMonth {
    if (month < 10) {
      return '0$month';
    } else {
      return '$month';
    }
  }

  String get fullDay {
    if (day < 10) {
      return '0$day';
    } else {
      return '$day';
    }
  }

  String get fullHour {
    if (hour < 10) {
      return '0$hour';
    } else {
      return '$hour';
    }
  }

  String get fullMinute {
    if (minute < 10) {
      return '0$minute';
    } else {
      return '$minute';
    }
  }
}

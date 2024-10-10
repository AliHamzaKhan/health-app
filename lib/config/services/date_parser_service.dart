import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_print.dart';

class DateTimeParserService {
  String FORMAT = 'yyyy-MM-dd HH:mm:ss';
  String FORMAT2 = 'yyyy-MM-dd 00:00:00';
  String FORMAT3 = 'yyyy-MMM-dd';
  String FORMAT4 = 'yyyy-MMM-dd HH:mm:ss';

  String timeDifferenceTillNowToDisplay(String stringDate,
      {myCurrentTime = false}) {
    String differenceInString = "Just now.";

    if (myCurrentTime) {
      // convertToTimeZone('','');
    }

    DateTime oldTime = DateTime.parse(stringDate);

    Duration duration = DateTime.now().difference(oldTime);

    int years = (duration.inDays / 365).floor();

    int months = (duration.inDays / 30).floor();

    int weeks = (duration.inDays / 7).floor();

    int days = (duration.inDays).floor();

    int hours = duration.inHours.floor();

    int minutes = duration.inMinutes.floor();

    int seconds = duration.inSeconds.floor();

    if (years > 0) {
      return "${years}Y ago";
    } else if (months > 0) {
      return "${months}mon ago";
    } else if (weeks > 0) {
      return "${weeks}w ago";
    } else if (days > 0) {
      return "${days}d ago";
    } else if (hours > 0) {
      return "${hours}h ago";
    } else if (minutes > 0) {
      return "${minutes}m ago";
    } else if (seconds > 0) {
      return "${seconds}s ago";
    } else {
      return differenceInString;
    }
  }

  String dateParser(String date, {String? format}) {
    String formatted = '';
    try {
      final DateTime parseDate = DateTime.parse(date);
      final DateFormat formatter = DateFormat(format ?? FORMAT, 'en_US');
      formatted = formatter.format(parseDate);
    } catch (e) {
      formatted = date;
    }

    return formatted;
  }

  DateTime? getDate(date, {format}) {
    if (date == null || date.isEmpty) {
      return null;
    }

    try {
      DateTime dateTime = DateFormat(format ?? "yyyy-MM-dd").parseUtc(date);
      return dateTime;
    } catch (e) {
      return null;
    }
  }

  String getFormattedDate(DateTime date, {format}) {
    var formatter = DateFormat(format ?? FORMAT2);
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  String pbParseTime(String date) {
    DateFormat format = DateFormat("HH:mm:ss");
    var dateTime = format.parseUTC(date);
    DateTime dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return dateOnly.toString();
  }

  DateTime parseCustomDate(String createdAt) {
    String dateString = createdAt.split(' (')[0];
    final inputFormat = DateFormat('EEE MMM dd yyyy HH:mm:ss "GMT"Z');
    const customFormat = 'EEE MMM dd yyyy HH:mm:ss';
    return DateTime.parse(
      DateFormat(customFormat, 'en_US').parse(dateString).toString(),
    );
  }

  String getCurrentDateInString() {
    var now = DateTime.now();
    var formatter = DateFormat(FORMAT2);
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  TimeOfDay parseTimeString(String timeString) {
    List<String> parts = timeString.split(' ');
    if (parts.length != 2) {
      throw FormatException("Invalid time format: $timeString");
    }

    int? hour = int.tryParse(parts[0]);
    if (hour == null || hour < 1 || hour > 12) {
      throw FormatException("Invalid hour: $hour");
    }

    String period = parts[1].toUpperCase();
    if (period != 'AM' && period != 'PM') {
      throw FormatException("Invalid period: $period");
    }

    // Convert to 24-hour format if necessary
    if (period == 'PM' && hour != 12) {
      hour += 12;
    } else if (period == 'AM' && hour == 12) {
      hour = 0;
    }

    return TimeOfDay(hour: hour, minute: 0);
  }

  parseTimeInto24Hours(timeStr) {
    try {
      DateTime time = DateFormat('h a').parse(timeStr);
      int hour = time.hour;
      return hour;
    } catch (e) {
      // Handle parsing errors, such as invalid time format
      debugPrint('Error parsing time: $timeStr');
      return -1; // Return a default value or indicate an error
    }
  }

  convertDateIntoTimeDateTime(dateTime) {
    TimeOfDay timeOfDay = TimeOfDay.fromDateTime(dateTime);
    int hour = timeOfDay.hour;
    int minute = timeOfDay.minute;
    var period = timeOfDay.period.name;
    debugPrint('$hour:$minute $period');
    return '$hour:$minute $period';
  }

  compareDates(String a, String b) {
    DateTime dateA = parseCustomDate(a);
    DateTime dateB = parseCustomDate(b);
    return dateA.compareTo(dateB);
  }

  bool isDateBefore(String a, String b) {
    var d1 = DateTime.parse(a);
    var d2 = DateTime.parse(b);
    return d2.isBefore(d1);
  }

  int getDays({required String startDate, required String endDate}) {
    final a = DateTime.parse(startDate);
    final b = DateTime.parse(endDate);
    return b.difference(a).inDays;
  }

  // String getDifference(String dateTime) {
  //   var currentTime = DateTime.now();
  //   DateTime targetTime = DateTime.parse(dateTime).toUtc();
  //   Duration difference = currentTime.difference(targetTime);
  //   return formatDuration(difference);
  // }
  //
  // String formatDuration(Duration duration) {
  //   if (duration.inMinutes < 60) {
  //     return "${duration.inMinutes} mins";
  //   } else if (duration.inHours < 24) {
  //     int hours = duration.inHours;
  //     int minutes = duration.inMinutes.remainder(60);
  //     return "${hours} hours ${minutes} mins";
  //   } else {
  //     int days = duration.inDays;
  //     return "${days} days";
  //   }
  // }
  String getDifference(String dateTime) {
    // var dateTime = '2024-06-07T15:12:56Z';
    appDebugPrint('dateTime $dateTime');
    var currentTime = DateTime.now().toUtc(); // Convert current time to UTC
    DateTime targetTime;

    if (dateTime.endsWith('Z')) {
      targetTime = DateTime.parse(dateTime);
    } else {
      targetTime = DateTime.parse(dateTime).toUtc();
    }
    Duration difference = currentTime.difference(targetTime);
    return formatDuration(difference);
  }

  String formatDuration(Duration duration) {
    if (duration.isNegative) {
      duration = duration.abs();
      return "${_formatPositiveDuration(duration)}";
    }
    return _formatPositiveDuration(duration);
  }

  String _formatPositiveDuration(Duration duration) {
    if (duration.inMinutes < 60) {
      return "${duration.inMinutes} mins";
    } else if (duration.inHours < 24) {
      int hours = duration.inHours;
      int minutes = duration.inMinutes.remainder(60);
      return "${hours} hours ${minutes} mins";
    } else {
      int days = duration.inDays;
      int hours = duration.inHours.remainder(24);
      return "${days} days ${hours} hours";
    }
  }
}

DateTimeParserService dateTimeParserService = DateTimeParserService();

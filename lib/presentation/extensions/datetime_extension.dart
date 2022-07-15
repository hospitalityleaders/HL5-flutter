import 'package:holedo/presentation/data/presentation_data.dart';

extension DateTimeExtension on DateTime {
  String get getMonthInString => monthList[month - 1].toString();
  String get getYearInString => year.toString();
}

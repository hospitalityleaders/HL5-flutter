import 'package:holedo/presentation/data/presentation_data.dart';

extension DateTimeExtension on DateTime {
  String get getMonthInString =>
      PresentationData.monthList[this.month - 1].toString();
}

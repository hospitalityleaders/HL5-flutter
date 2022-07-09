enum TimelineClassTypes {
  Education,
  Achievement,
  Experience,
}

class TimelineClass {
  final int id;
  final DateTime dateTime;
  final TimelineClassTypes timelineClassType;
  final dynamic timeline;

  TimelineClass(this.id, this.dateTime, this.timelineClassType, this.timeline);

  @override
  String toString() {
    return 'TimelineClass(id: $id, dateTime: $dateTime, timelineClassType: $timelineClassType, timeline: $timeline)';
  }
}

class ProfileNotification {
  final String text;
  final String buttonText;

  ProfileNotification(this.text, this.buttonText);
}

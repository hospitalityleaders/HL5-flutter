import 'package:holedo/db_data.dart';
import 'package:holedo/presentation/ui_classes.dart';

class HelperFunctions {
  List<String> splitText(String text, int lenghtOfFirstString) {
    List<String> result = [];
    // Getting first text from given string
    String firstText = text.substring(0, lenghtOfFirstString);
    int lastWordsLenght = _getLenthOfLastWord(firstText);
    firstText = _removeLastWords(firstText);

    result.add(firstText);
    // Getting second text from given string
    String secondText = text.substring(lenghtOfFirstString - lastWordsLenght);
    result.add(secondText);
    // return the result
    return result;
  }

  String _removeLastWords(String text) {
    final List<String> wordsInList = text.split(" ");
    wordsInList.removeLast();
    if (wordsInList.last.length > 3) wordsInList.removeLast();
    return wordsInList.join(" ");
  }

  int _getLenthOfLastWord(String text) {
    List<String> wordsInList = text.split(" ");
    int lenght = wordsInList.last.length;

    if (wordsInList.last.length > 3) {
      wordsInList.removeLast();
      lenght += wordsInList.last.length + 1;
    }
    return lenght;
  }

  String? findKeyByValueFromMap(Map<String, String> givenMap, String value) {
    return givenMap.keys.firstWhere((k) => givenMap[k] == value);
  }

  List<TimelineClass> listOfTimeline() {
    final userProfileData = DbData.getUserProfileData;
    final experiences = userProfileData.experiences;
    final achievements = userProfileData.achievements;
    final educations = userProfileData.educations;
    List<TimelineClass> _timelineClassList = <TimelineClass>[];
    if (experiences != null && experiences.isNotEmpty) {
      experiences.forEach(
        (experience) {
          if (experience.toDate != null) {
            _timelineClassList.add(
              TimelineClass(
                experience.id!,
                experience.toDate!,
                TimelineClassTypes.Experience,
                experience,
              ),
            );
          }
        },
      );
    }
    if (achievements != null && achievements.isNotEmpty) {
      achievements.forEach(
        (achievement) {
          if (achievement.dateReceived != null) {
            _timelineClassList.add(
              TimelineClass(
                achievement.id!,
                achievement.dateReceived!,
                TimelineClassTypes.Achievement,
                achievement,
              ),
            );
          }
        },
      );
    }
    if (educations != null && educations.isNotEmpty) {
      educations.forEach(
        (education) {
          if (education.durationToDate != null) {
            _timelineClassList.add(
              TimelineClass(
                education.id!,
                education.durationToDate!,
                TimelineClassTypes.Education,
                education,
              ),
            );
          }
        },
      );
    }
    _timelineClassList.sort(((a, b) => b.dateTime.compareTo(a.dateTime)));
    return _timelineClassList;
  }
}

import 'package:holedo/db_data.dart';
import 'package:holedo/presentation/classes.dart';

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

  static String? findKeyByValueFromMap(
      Map<String, String> givenMap, String value) {
    return givenMap.keys.firstWhere((k) => givenMap[k] == value);
  }

  List<TimelineClass> listOfTimeline() {
    final userProfileData = DbData.getUserProfileData;
    final experiences = userProfileData.experiences;
    final achievements = userProfileData.achievements;
    final educations = userProfileData.educations;
    List<TimelineClass> timelineClassList = <TimelineClass>[];
    if (experiences != null && experiences.isNotEmpty) {
      for (var experience in experiences) {
        if (experience.fromDate != null) {
          timelineClassList.add(
            TimelineClass(
              experience.id!,
              experience.fromDate!,
              TimelineClassTypes.Experience,
              experience,
            ),
          );
        }
      }
    }
    if (achievements != null && achievements.isNotEmpty) {
      for (var achievement in achievements) {
        if (achievement.created != null) {
          timelineClassList.add(
            TimelineClass(
              achievement.id!,
              achievement.created!,
              TimelineClassTypes.Achievement,
              achievement,
            ),
          );
        }
      }
    }
    if (educations != null && educations.isNotEmpty) {
      for (var education in educations) {
        if (education.durationFromDate != null) {
          timelineClassList.add(
            TimelineClass(
              education.id!,
              education.durationFromDate!,
              TimelineClassTypes.Education,
              education,
            ),
          );
        }
      }
    }
    timelineClassList.sort(((a, b) => b.dateTime.compareTo(a.dateTime)));
    return timelineClassList;
  }
}

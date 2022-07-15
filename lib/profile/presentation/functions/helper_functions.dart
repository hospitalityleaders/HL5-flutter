class HelperFunctions {
  List<String> splitText(String text, int lenghtOfFirstString) {
    final List<String> result = [];
    // Getting first text from given string
    String firstText = text.substring(0, lenghtOfFirstString);
    final int lastWordsLenght = _getLenthOfLastWord(firstText);
    firstText = _removeLastWords(firstText);

    result.add(firstText);
    // Getting second text from given string
    final String secondText =
        text.substring(lenghtOfFirstString - lastWordsLenght);
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
    final List<String> wordsInList = text.split(" ");
    int lenght = wordsInList.last.length;

    if (wordsInList.last.length > 3) {
      wordsInList.removeLast();
      lenght += wordsInList.last.length + 1;
    }
    return lenght;
  }

  static String? findKeyByValueFromMap(
    Map<String, String> givenMap,
    String value,
  ) {
    return givenMap.keys.firstWhere((k) => givenMap[k] == value);
  }
}

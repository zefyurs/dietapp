List<String> mealTime = ['아침', '점심', '저녁', '간식'];

List<String> mealType = ["균형잡힌", "단백질", "탄수화물", "지방", "폭식"];

class Utils {
  static String makeTowDiget(int number) {
    return number.toString().padLeft(2, '0');
  }

  static int getFormatTime(DateTime time) {
    return int.parse("${time.year}${makeTowDiget(time.month)}${makeTowDiget(time.day)}");
  }

  static DateTime stringToDateTime(String date) {
    int year = int.parse(date.substring(0, 4));
    int month = int.parse(date.substring(4, 6));
    int day = int.parse(date.substring(6, 8));

    return DateTime(year, month, day);
  }
}

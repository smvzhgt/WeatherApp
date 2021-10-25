import 'package:intl/intl.dart';

class DateFormatter {
  static String format(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    var formatter = DateFormat('EEEE dd MMMM');
    return formatter.format(dateTime);
  }
}

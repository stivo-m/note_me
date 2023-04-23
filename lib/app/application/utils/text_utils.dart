import 'package:timeago/timeago.dart' as timeago;

class TextUtils {
  static String formatTimeAgo(dynamic time) {
    late DateTime dateTime;

    if (time is String) {
      dateTime = DateTime.tryParse(time) ?? DateTime.now();
    } else if (time is DateTime) {
      dateTime = time;
    } else {
      dateTime = DateTime.now();
    }

    return timeago.format(dateTime);
  }
}

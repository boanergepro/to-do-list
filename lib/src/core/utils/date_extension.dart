import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  /// Returns the date in the format 'yyyy-MM-dd'
  String toIsoString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}

import 'package:intl/intl.dart';

extension StringExtensionNullable on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  DateTime? toDateTime() {
    if (isNullOrEmpty) return null;
    return DateFormat('yyyy-MM-dd').parse(this!);
  }
}

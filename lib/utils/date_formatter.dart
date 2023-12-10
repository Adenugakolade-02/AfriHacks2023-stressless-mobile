 import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
    // Define the desired format
    final format = DateFormat('E, d\'th\' MMM yyyy');

    // Format the DateTime object
    return format.format(dateTime);
  }
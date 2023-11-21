import 'package:intl/intl.dart';

String formatDate(DateTime dateTime){
  return DateFormat('yyyy-MM dd, hh:mm aaa').format(dateTime);
}
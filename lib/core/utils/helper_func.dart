import 'package:intl/intl.dart';

String dateFormatter(DateTime date) {
  DateFormat dateFormat = DateFormat('d MMM, yyyy');
  String formattedDate = dateFormat.format(date);
  formattedDate = formattedDate.replaceRange(0, 1, formattedDate[0].toUpperCase());

  return formattedDate;
}

String extractAmount(String input) {
  final RegExp regex = RegExp(r'\d+');
  final Match? match = regex.firstMatch(input);
  if (match != null) {
    return match.group(0)!;
  } else {
    return '';
  }
}

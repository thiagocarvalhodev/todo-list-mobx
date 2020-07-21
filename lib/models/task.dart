import 'package:intl/intl.dart';

class Task {
  String name;
  DateTime date;
  bool isFinished;

  get getDateFormatted =>
      date == null ? null : DateFormat.yMMMd().format(this.date);

  Task({this.name, this.date, this.isFinished});
}

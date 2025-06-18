import 'package:patient_app/core/function/date_format.dart';

void main(List<String> args) {
  final myDate = DateTime.now();
  print(myDate.getYearMonthDay(commaShape: "/"));
}

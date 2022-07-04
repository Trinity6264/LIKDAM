part of 'end_date_cubit.dart';

@immutable
abstract class EndDateState {}

class EndDateInitial extends EndDateState {}

class EndDatePicked extends EndDateState {
  final DateTime dateTime;
  EndDatePicked({required this.dateTime});
}

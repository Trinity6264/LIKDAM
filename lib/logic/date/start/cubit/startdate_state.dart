part of 'startdate_cubit.dart';

@immutable
abstract class StartdateState {}

class StartdateInitial extends StartdateState {}

class Startdatedone extends StartdateState {
  final DateTime? date;
  Startdatedone({required this.date});
}

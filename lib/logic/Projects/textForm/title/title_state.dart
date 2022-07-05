part of 'title_cubit.dart';

@immutable
abstract class TitleState {}

class TitleInitial extends TitleState {}

class TitleUpdated extends TitleState {
  final String title;
  TitleUpdated({required this.title});
}


part of 'description_cubit.dart';

@immutable
abstract class DescriptionState {}

class DescriptionInitial extends DescriptionState {}

class DescriptionUpdate extends DescriptionState {
  final String description;
  DescriptionUpdate({required this.description});
}

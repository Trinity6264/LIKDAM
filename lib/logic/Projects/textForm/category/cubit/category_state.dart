part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryUpdate extends CategoryState {
  final String text;
  CategoryUpdate({required this.text});
}

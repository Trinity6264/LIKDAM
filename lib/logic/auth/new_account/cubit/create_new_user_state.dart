part of 'create_new_user_cubit.dart';

@immutable
abstract class CreateNewUserState {}

class CreateNewUserInitial extends CreateNewUserState {}

class CreateNewUserLoading extends CreateNewUserState {}


class CreateNewUserSuccess extends CreateNewUserState {
  final int userId;
  CreateNewUserSuccess({required this.userId});
}

class CreateNewUserError extends CreateNewUserState {
  final String errormessage;
  CreateNewUserError({required this.errormessage});
}

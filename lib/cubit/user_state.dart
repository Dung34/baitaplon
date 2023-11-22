part of 'user_cubit.dart';

abstract class UserState {}

final class UserInitial extends UserState {}

final class LoginAdminSuccess extends UserState {}

final class LoginUserSuccess extends UserState {}

final class LoginNotPermission extends UserState {}

final class LoginWrong extends UserState {}

final class LoginFailed extends UserState {}

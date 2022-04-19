part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthRegisteredState extends AuthState {}

class AuthFailedState extends AuthState {}

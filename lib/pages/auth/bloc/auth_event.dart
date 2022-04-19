part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegistrationEvent extends AuthEvent {
  final String username;
  final String password;

  RegistrationEvent({required this.password, required this.username});
}

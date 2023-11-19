part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogIn extends AuthEvent {
  final String login;
  final String password;

  const AuthLogIn({required this.login, required this.password});

  @override
  List<Object> get props => [login, password];
}

class AuthLogOut extends AuthEvent {
  const AuthLogOut();
}

class AuthAppStarted extends AuthEvent {
  const AuthAppStarted();
}





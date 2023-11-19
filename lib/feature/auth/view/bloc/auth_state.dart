part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final AccountEntity? account;
  final ExceptionWithTrace? error;

  const AuthState({this.account, this.error});

  @override
  List<Object?> get props => [account, error];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthInProgress extends AuthState {
  const AuthInProgress();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(AccountEntity account) : super(account: account);
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthError extends AuthState {
  const AuthError(ExceptionWithTrace error) : super(error: error);
}

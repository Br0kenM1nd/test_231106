import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_231106/core/resources/data_state.dart';
import 'package:test_231106/core/resources/exception_with_trace.dart';
import 'package:test_231106/feature/auth/domain/use_case/use_case.dart';

import '../../domain/entity/account_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;

  AuthBloc(this._authUseCase) : super(const AuthInitial()) {
    on<AuthLogIn>(logIn);
    on<AuthLogOut>(logOut);
    on<AuthAppStarted>(appStarted);
  }

  Future<void> logIn(AuthLogIn event, Emitter<AuthState> emit) async {
    final authState = await _authUseCase(params: [event.login, event.password]);

    if (authState is DataSuccess && authState.data != null) {
      emit(AuthAuthenticated(authState.data!));
    } else if (authState is DataFailed && authState.error != null) {
      log(authState.error.toString());
      emit(AuthError(authState.error!));
    }
  }

  void logOut(AuthLogOut event, Emitter<AuthState> emit) {
    emit(const AuthUnauthenticated());
  }

  void appStarted(AuthAppStarted event, Emitter<AuthState> emit) {
    emit(const AuthUnauthenticated());
  }
}

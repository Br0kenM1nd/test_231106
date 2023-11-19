import 'package:flutter/cupertino.dart';
import 'package:test_231106/core/resources/data_state.dart';
import 'package:test_231106/core/use_case/use_case.dart';
import 'package:test_231106/feature/auth/domain/exception/validation_exception.dart';
import 'package:test_231106/feature/auth/domain/repository/auth_repository.dart';

class AuthUseCase implements UseCase<DataState, List<String>> {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  @override
  Future<DataState> call({List<String>? params}) async {
    try {
      validateCredentials(params);
      return await _authRepository.getAccount(params!);
    } on ValidationException catch (e) {
      return DataFailed(e, StackTrace.current);
    } on Error catch (e, s) {
      return DataFailed(Exception(e.toString()), s);
    } catch (e, s) {
      return DataFailed(e, s);
    }
  }

  @visibleForTesting
  void validateCredentials(List<String>? params) {
    if (params?.length != 2) {
      throw ValidationException('Неверное кол-во параметров');
    }

    if (!isValidLogin(params!.first)) {
      throw ValidationException('Неверный логин');
    }

    if (!isValidPassword(params.last)) {
      throw ValidationException('Неверный пароль');
    }
  }

  @visibleForTesting
  isValidLogin(String login) => login.length >= 3;

  @visibleForTesting
  isValidPassword(String login) => login.length >= 5;
}

import 'package:test_231106/feature/auth/domain/entity/account_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_api_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _service;

  AuthRepositoryImpl(this._service);

  @override
  Future<DataState<AccountEntity>> getAccount(List<String> params) async {
    try {
      final account = await _service.logIn(params);
      return DataSuccess(account);
    } catch (ex, trace) {
      return DataFailed(ex, trace);
    }
  }
}

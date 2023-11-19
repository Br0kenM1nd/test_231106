import '../../domain/entity/account_entity.dart';

abstract class AuthApiService {
  Future<AccountEntity> logIn(List<String> credentials);
}

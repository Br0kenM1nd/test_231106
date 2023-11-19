import '../../../../core/resources/data_state.dart';
import '../entity/account_entity.dart';

abstract class AuthRepository {
  Future<DataState<AccountEntity>> getAccount(List<String> params);
}

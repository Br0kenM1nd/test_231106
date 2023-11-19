import '../../model/account_model.dart';
import '../auth_api_service.dart';

class AuthMockApiService implements AuthApiService {
  @override
  Future<AccountModel> logIn(List<String> credentials) async {
    // fake loading
    await Future.delayed(const Duration(microseconds: 500));
    return AccountModel(id: '12345', name: credentials.first);
  }
}

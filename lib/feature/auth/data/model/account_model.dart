import 'package:test_231106/feature/auth/domain/entity/account_entity.dart';

class AccountModel extends AccountEntity {
  const AccountModel({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory AccountModel.fromJson(Map<String, dynamic> map) =>
      AccountModel(id: map['id'] ?? '', name: map['name'] ?? '');
}

import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String id;
  final String name;

  const AccountEntity({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}

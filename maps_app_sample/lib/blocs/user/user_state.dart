part of 'user_bloc.dart';

class UserState extends Equatable {
  final String name, lastName, idUser;
  final int edad;

  const UserState(
      {required this.name,
      required this.lastName,
      required this.idUser,
      required this.edad});

  @override
  List<Object> get props => [];

  @override
  String toString() => '{name : $name, lastName : $lastName}';
}

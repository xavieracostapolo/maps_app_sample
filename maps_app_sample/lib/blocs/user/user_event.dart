part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UserEvent {
  final String name, lastName, idUser;
  final int edad;

  const CreateUserEvent(
      {required this.name,
      required this.lastName,
      required this.idUser,
      required this.edad});
}

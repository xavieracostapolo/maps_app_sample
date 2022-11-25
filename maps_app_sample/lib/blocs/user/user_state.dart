part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserModel user;

  const UserState({required this.user});

  @override
  List<Object> get props => [];

  @override
  String toString() => '${user.toJson()}';
}

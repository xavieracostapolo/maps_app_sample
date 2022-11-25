import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:maps_app_sample/models/user_model.dart';
import 'package:maps_app_sample/repository/user_repository_interface.dart';

part 'user_event.dart';
part 'user_state.dart';

@singleton
class UserBloc extends Bloc<UserEvent, UserState> {

  final IUserRepository _userRepository;
  
  UserBloc(this._userRepository)
      : super(const UserState(
            user: UserModel(name: '', lastName: '', idUser: '', edad: 0))) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> createUser(String name, String lastName, int edad) async {
    _userRepository.createUser(name, lastName, edad);
  }

  Future<void> createUserId(String name, String lastName, int edad) async {
    _userRepository.createUserId(name, lastName, edad);
  }

  Future<void> update(String name) async {
    _userRepository.update(name);
  }
}

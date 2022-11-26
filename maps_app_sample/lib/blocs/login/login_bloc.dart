import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:maps_app_sample/blocs/login/form_submission_status.dart';

part 'login_event.dart';
part 'login_state.dart';

@singleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginUsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));

    try {
      await Future.delayed(const Duration(seconds: 5));
      //throw Exception('Error de prueba');
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } on Exception catch (_) {
      emit(state.copyWith(formStatus: SubmissionFailed(_)));
    }
  }
}

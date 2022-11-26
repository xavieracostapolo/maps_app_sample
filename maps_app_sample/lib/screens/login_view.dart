import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app_sample/blocs/login/form_submission_status.dart';
import 'package:maps_app_sample/blocs/login/login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _loginForm());
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _usernameField(),
                _passwordField(),
                _loginButton(),
              ],
            )),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.person), hintText: 'Username'),
          validator: (value) =>
              state.isValidUsername ? null : 'Username muy corto',
          onChanged: (value) => BlocProvider.of<LoginBloc>(context)
              .add(LoginUsernameChanged(value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              icon: Icon(Icons.security), hintText: 'Password'),
          validator: (value) =>
              state.isValidPassword ? null : 'Password muy corto',
          onChanged: (value) => BlocProvider.of<LoginBloc>(context)
              .add(LoginPasswordChanged(value)),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<LoginBloc>(context).add(LoginSubmitted());
                  }
                },
              );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

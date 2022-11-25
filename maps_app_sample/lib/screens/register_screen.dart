import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app_sample/blocs/blocs.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar usuario.'),
      ),
      body: Column(children: [
        TextFormField(),
        TextFormField(),
        ElevatedButton(
            onPressed: () {
              final userBloc = BlocProvider.of<UserBloc>(context);
              userBloc.createUser('name', 'lastName', 15);
              //Navigator.pushNamed(context, '/map');
            },
            child: const Text('map')),
        ElevatedButton(
            onPressed: () {
              final userBloc = BlocProvider.of<UserBloc>(context);
              userBloc.createUserId('name', 'lastName', 25);
            },
            child: const Text('Create Data 2')),
        ElevatedButton(
            onPressed: () {
              final userBloc = BlocProvider.of<UserBloc>(context);
              userBloc.update('name');
            },
            child: const Text('Update Data'))
      ]),
    );
  }
}

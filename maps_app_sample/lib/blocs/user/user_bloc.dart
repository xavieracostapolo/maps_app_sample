import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(const UserState(name: '', lastName: '', idUser: '', edad: 0)) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> createUser(String name, String lastName, int edad) async {
    final id = const Uuid().v4();
    final db = FirebaseFirestore.instance;

    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "idClient": id,
      "Name": name,
      "LastName": lastName,
      "Edad": edad
    };

// Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));

    print('ID - $id');
  }
}

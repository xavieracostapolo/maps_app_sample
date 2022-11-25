import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:maps_app_sample/models/user_model.dart';
import 'package:maps_app_sample/repository/user_repository_interface.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: IUserRepository)
class UserRepository extends IUserRepository {
  @override
  Future<void> createUser(String name, String lastName, int edad) async {
    final id = const Uuid().v4();

    // Create a new user with a first and last name
    final user =
        UserModel(name: name, lastName: lastName, idUser: id, edad: edad);

    try {
      DocumentReference doc = await FirebaseFirestore.instance
          .collection("users")
          .add(user.toJson());
      print('DocumentSnapshot added with ID: ${doc.id}');
      print('ID - $id');
    } on FirebaseException catch (e) {
      print('Error FirebaseException $e');
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Future<void> createUserId(String name, String lastName, int edad) async {
    final id = const Uuid().v4();

    // Create a new user with a first and last name
    final user =
        UserModel(name: name, lastName: lastName, idUser: id, edad: edad);

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(id)
          .set(user.toJson());
      print('DocumentSnapshot added with ID: $id');
      print('ID - $id');
    } on FirebaseException catch (e) {
      print('Error FirebaseException $e');
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Future<void> update(String name) async {
    final user =
        UserModel(name: name, lastName: 'lastName', idUser: 'idUser', edad: 20);

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc("12345")
          .set(user.toJson());
    } on FirebaseException catch (e) {
      print('Error FirebaseException $e');
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}

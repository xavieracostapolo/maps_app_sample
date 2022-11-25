abstract class IUserRepository {
  Future<void> createUser(String name, String lastName, int edad);
  Future<void> createUserId(String name, String lastName, int edad);
  Future<void> update(String name);
}
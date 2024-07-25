import 'package:appwrite/models.dart' as models;

abstract class BaseAuthRepository {
  Future<models.User> signUp({required String email, required String password});
  Future<models.Session> signIn(
      {required String email, required String password});
  Future<void> signOut();
  Future<models.User?> getCurrentUser();
}

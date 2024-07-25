import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';

class AppwriteAuthRepository extends BaseAuthRepository {
  AppwriteAuthRepository({required this.account});

  final Account account;

  @override
  Future<User?> getCurrentUser() async {
    try {
      final user = await account.get();
      return user;
    } on AppwriteException catch (e) {
      if (e.code == 401) {
        return null; // User is not logged in
      }
      throw _handleError(e);
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Session> signIn(
      {required String email, required String password}) async {
    try {
      final session = await account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      return session;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic e) {
    if (e is AppwriteException) {
      return Exception(e.message);
    }
    return Exception('An unexpected error occurred');
  }
}

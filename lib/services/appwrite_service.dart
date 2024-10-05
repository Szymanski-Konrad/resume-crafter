import 'package:appwrite/appwrite.dart';
import 'package:resume_crafter/core/environment.dart';

class AppwriteService {
  static final AppwriteService instance = AppwriteService._internal();

  late final Client client;
  late final Account account;
  late final Databases databases;

  AppwriteService._internal() {
    _initialize();
  }

  factory AppwriteService() {
    return instance;
  }

  void _initialize() {
    client = Client()
        .setEndpoint(Env.appwriteEndpoint)
        .setProject(Env.appwriteProjectId)
        .setSelfSigned(status: Env.appwriteSelfSigned);
    account = Account(client);
    databases = Databases(client);
  }
}

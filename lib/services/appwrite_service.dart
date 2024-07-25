import 'package:appwrite/appwrite.dart';
import 'package:resume_crafter/core/constants.dart';

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
        .setEndpoint(Constants.appwriteEndpoint)
        .setProject(Constants.appwriteProjectId)
        .setSelfSigned(status: Constants.appwriteSelfSigned);
    account = Account(client);
    databases = Databases(client);
  }
}

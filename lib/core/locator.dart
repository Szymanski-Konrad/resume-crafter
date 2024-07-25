import 'package:get_it/get_it.dart';
import 'package:resume_crafter/repositories/auth/appwrite_auth_repository.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';
import 'package:resume_crafter/services/appwrite_service.dart';

final locator = GetIt.instance;

class ServiceLocator {
  factory ServiceLocator() => _singleton;

  const ServiceLocator._internal();

  static const ServiceLocator _singleton = ServiceLocator._internal();

  Future<void> _initServices() async {}

  Future<void> _initRepositories() async {
    locator.registerLazySingleton<BaseAuthRepository>(
      () => AppwriteAuthRepository(account: AppwriteService.instance.account),
    );
  }

  Future<void> configure() async {
    await _initServices();
    await _initRepositories();
  }
}

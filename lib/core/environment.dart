abstract class Env {
  const Env._();

  static String appwriteEndpoint =
      const String.fromEnvironment('APPWRITE_ENDPOINT');
  static String appwriteProjectId =
      const String.fromEnvironment('APPWRITE_PROJECT_ID');
  static bool appwriteSelfSigned = true;
  static String appwriteDatabaseId =
      const String.fromEnvironment('APPWRITE_DATABASE_ID');
  static String appwriteResumesCollectionId =
      const String.fromEnvironment('APPWRITE_RESUME_COLLECTION_ID');
  static String appwriteResumesMetadataCollectionId =
      const String.fromEnvironment('APPWRITE_RESUME_METADATA_COLLECTION_ID');
}

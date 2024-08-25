import 'package:appwrite/appwrite.dart';
import 'package:resume_crafter/core/constants.dart';
import 'package:resume_crafter/data/resume_metadata.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/repositories/auth/resume/base_resume_repository.dart';
import 'package:resume_crafter/services/appwrite_service.dart';

class AppwriteResumeRepository extends BaseResumeRepository {
  AppwriteResumeRepository({
    required this.appwriteService,
  });

  final AppwriteService appwriteService;

  @override
  Future<void> createUserResumeMetadata({
    required String userId,
    required String name,
  }) async {
    final documentId = ID.unique();
    await appwriteService.databases.createDocument(
      databaseId: Constants.appwriteDatabaseId,
      collectionId: Constants.appwriteResumesMetadataCollectionId,
      documentId: documentId,
      data: ResumeMetadata(
        id: documentId,
        name: name,
        userId: userId,
        resumeId: ID.unique(),
        createdAt: DateTime.now(),
      ).toJson(),
    );
  }

  @override
  Future<List<ResumeMetadata>> getUserAllResumeMetadata({
    required String userId,
  }) async {
    final response = await appwriteService.databases.listDocuments(
      databaseId: Constants.appwriteDatabaseId,
      collectionId: Constants.appwriteResumesMetadataCollectionId,
      queries: [
        Query.equal(ResumeMetadataFields.userId, userId),
      ],
    );
    return response.convertTo<ResumeMetadata>(
      (document) => ResumeMetadata.fromJson(document as Map<String, dynamic>),
    );
  }

  @override
  Future<void> createUserResume({
    required String userId,
    required String name,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<ResumeModel> getUserResume({
    required String userId,
    required String resumeId,
  }) async {
    final response = await appwriteService.databases.getDocument(
      databaseId: Constants.appwriteDatabaseId,
      collectionId: Constants.appwriteResumesCollectionId,
      documentId: resumeId,
    );
    return ResumeModel.fromJson(response.data);
  }

  @override
  Future<void> updateUserResume({
    required String userId,
    required String resumeId,
    required ResumeModel resumeModel,
  }) async {
    await appwriteService.databases.updateDocument(
      databaseId: Constants.appwriteDatabaseId,
      collectionId: Constants.appwriteResumesCollectionId,
      documentId: resumeId,
      data: resumeModel.toJson(),
    );
  }

  @override
  Future<void> updateUserResumeMetadata({
    required String userId,
    required String resumeMetadataId,
    required ResumeMetadata resumeMetadata,
  }) async {
    await appwriteService.databases.updateDocument(
      databaseId: Constants.appwriteDatabaseId,
      collectionId: Constants.appwriteResumesMetadataCollectionId,
      documentId: resumeMetadataId,
      data: resumeMetadata.toJson(),
    );
  }
}

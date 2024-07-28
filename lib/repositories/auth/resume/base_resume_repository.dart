import 'package:resume_crafter/data/resume_metadata.dart';
import 'package:resume_crafter/data/resume_model.dart';

abstract class BaseResumeRepository {
  Future<List<ResumeMetadata>> getUserAllResumeMetadata({
    required String userId,
  });
  Future<ResumeModel> getUserResume({
    required String userId,
    required String resumeId,
  });
  Future<void> createUserResumeMetadata({
    required String userId,
    required String name,
  });
  Future<void> createUserResume({
    required String userId,
    required String name,
  });
  Future<void> updateUserResume({
    required String userId,
    required String resumeId,
    required ResumeModel resumeModel,
  });
  Future<void> updateUserResumeMetadata({
    required String userId,
    required String resumeMetadataId,
    required ResumeMetadata resumeMetadata,
  });
}

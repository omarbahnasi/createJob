import 'package:create_job/domain/entities/createJobPost.dart';

abstract class JobPostRepository {
  Future<void> createJobPost(JobPost jobPost);
}

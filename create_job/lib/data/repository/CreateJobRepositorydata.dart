import 'package:create_job/data/datasource/remoteDataSource.dart';
import 'package:create_job/data/models/createJobPostModel.dart';
import 'package:create_job/domain/entities/createJobPost.dart';

import 'package:create_job/domain/repository/creat_job_repository.dart';

class JobPostRepositoryImpl implements JobPostRepository {
  final RemoteDataSource _remoteDataSource;

  JobPostRepositoryImpl({required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<void> createJobPost(JobPost jobPost) async {
    final jobPostModel = JobPostModel(
      id: jobPost.id,
      title: jobPost.title,
      description: jobPost.description,
      salary: jobPost.salary,
      skills: jobPost.skills,
    );
    try {
      await _remoteDataSource.postjobToApi(
        jobPostModel.id,
        jobPostModel.title,
        jobPostModel.description,
        jobPostModel.salary,
        jobPostModel.skills,
      );
    } catch (e) {
      throw Exception('Failed to create job post: $e');
    }
  }
}

import 'package:create_job/data/repository/CreateJobRepositorydata.dart';
import 'package:create_job/domain/repository/creat_job_repository.dart';

import '../entities/createJobPost.dart';
// this use case to get the job from the presentation layer and send it to API through repository ..Bahnasi
abstract class PostJobUseCase {
  PostJobUseCase(JobPostRepositoryImpl jobPostRepository);

  Future<void> postJob(String title, String description, int salary, List<String> skills);
}

class PostJob implements PostJobUseCase {
  final JobPostRepository _jobPostRepository;

  PostJob({required JobPostRepository jobPostRepository})
      : _jobPostRepository = jobPostRepository;

  @override
  Future<void> postJob(String title, String description, int salary, List<String> skills) async {
    final jobPost = JobPost(
      
      title: title,
      description: description,
      salary: salary,
      skills: skills, id: '',
    );
    await _jobPostRepository.createJobPost(jobPost);
  }
}
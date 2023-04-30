import 'package:dio/dio.dart';
import 'package:create_job/data/models/createJobPostModel.dart';

abstract class BaseremoteDataSource {
  Future<JobPostModel> postjobToApi(String id, String title, String description,
      int salary, List<String> skills);
}

class RemoteDataSource implements BaseremoteDataSource {
  final Dio _dio;
  final String _baseUrl;

  RemoteDataSource({required Dio dio, required String baseUrl})
      : _dio = dio,
        _baseUrl = baseUrl;

  @override
  Future<JobPostModel> postjobToApi(String id, String title, String description,
      int salary, List<String> skills) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/job-posts',
        data: {
          'id': id,
          'title': title,
          'description': description,
          'salary': salary,
          'skills': skills
        },
      );
      if (response.statusCode == 201) {
        // Job post created successfully
        final jobPostModel = JobPostModel.fromJson(response.data);
        return jobPostModel;
      } else {
        // Handle error
        throw Exception('Failed to create job post');
      }
    } on DioError catch (e) {
      // Handle Dio error
      if (e.response != null) {
        // Handle API error response
        throw Exception('Failed to create job post: ${e.response?.data}');
      } else {
        // Handle network error
        throw Exception('Failed to create job post: ${e.message}');
      }
    }
  }
}

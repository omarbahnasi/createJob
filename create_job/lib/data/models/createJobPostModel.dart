import '../../domain/entities/createJobPost.dart';

class JobPostModel extends JobPost {
  final String id;

  JobPostModel(
      {required this.id,
      required String title,
      required String description,
      required int salary,
      required List<String> skills})
      : super(
        id: id,
            title: title,
            description: description,
            salary: salary,
            skills: skills);

  factory JobPostModel.fromJson(Map<String, dynamic> json) {
    return JobPostModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      salary: json['salary'],
      skills: List<String>.from(json['skills']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'salary': salary,
      'skills': skills,
    };
  }
}

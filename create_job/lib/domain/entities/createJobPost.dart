class JobPost {
  final String id;
  final String title;
  final String description;
  final int salary;
  final List<String> skills;

  JobPost({
    required this.id,
    required this.title,
    required this.description,
    required this.salary,
    required this.skills,
  });

  

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'salary': salary,
      'skills': skills,
    };
  }
}

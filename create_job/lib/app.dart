import 'package:flutter/material.dart';
import 'package:create_job/data/datasource/remoteDataSource.dart';
import 'package:create_job/domain/repository/creat_job_repository.dart';
import 'package:create_job/domain/usecases/create_job_post.dart';
import 'presentation/screens/createpostscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CreateJob',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const CreateJobPostScreen(),
    );
  }
}

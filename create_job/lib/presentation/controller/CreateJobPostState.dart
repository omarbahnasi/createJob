part of 'createJobPostCubit.dart';

abstract class CreateJobPostState {}

class CreateJobPostInitial extends CreateJobPostState {}

class CreateJobPostLoading extends CreateJobPostState {}

class CreateJobPostSuccess extends CreateJobPostState {}

class CreateJobPostError extends CreateJobPostState {
  final String errorMessage;

  CreateJobPostError(this.errorMessage);
}

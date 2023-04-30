import 'package:bloc/bloc.dart';
import 'package:create_job/domain/usecases/create_job_post.dart';

part 'CreateJobPostState.dart';

class CreateJobPostCubit extends Cubit<CreateJobPostState> {
  final PostJobUseCase _postJobUseCase;

  CreateJobPostCubit({required PostJobUseCase postJobUseCase})
      : _postJobUseCase = postJobUseCase,
        super(CreateJobPostInitial());

  void createJobPost(
      String title, String description, int salary, List<String> skills) async {
    emit(CreateJobPostLoading());
    try {
      await _postJobUseCase.postJob(title, description, salary, skills);
      emit(CreateJobPostSuccess());
    } catch (e) {
      emit(CreateJobPostError(e.toString()));
    }
  }
}

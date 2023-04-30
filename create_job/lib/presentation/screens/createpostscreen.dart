import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "package:create_job/presentation/controller/createJobPostCubit.dart";

class CreateJobPostScreen extends StatelessWidget {
  final CreateJobPostCubit createJobPostCubit;

  const CreateJobPostScreen({required this.createJobPostCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: createJobPostCubit,
      child: BlocConsumer<CreateJobPostCubit, CreateJobPostState>(
        listener: (context, state) {
          if (state is CreateJobPostSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Job post created successfully'),
              ),
            );
            Navigator.of(context).pop();
          } else if (state is CreateJobPostError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CreateJobPostLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return CreateJobPostForm();
        },
      ),
    );
  }
}

class CreateJobPostForm extends StatefulWidget {
  @override
  _CreateJobPostFormState createState() => _CreateJobPostFormState();
}

class _CreateJobPostFormState extends State<CreateJobPostForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _salaryController;
  late final TextEditingController _skillsController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _salaryController = TextEditingController();
    _skillsController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _salaryController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(labelText: 'Salary'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a salary';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _skillsController,
                decoration: InputDecoration(labelText: 'Skills'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter at least one skill';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final title = _titleController.text;
                    final description = _descriptionController.text;
                    final salary = int.parse(_salaryController.text);
                    final skills = _skillsController.text
                        .split(',')
                        .map((e) => e.trim())
                        .toList();

                    BlocProvider.of<CreateJobPostCubit>(context).createJobPost(
                      title,
                      description,
                      salary,
                      skills,
                    );
                  }
                },
                child: Text('Create Job Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

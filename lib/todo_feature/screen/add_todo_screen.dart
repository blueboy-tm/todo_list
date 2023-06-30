import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:todo_list/todo_feature/logic/bloc/todo_bloc.dart';
import 'package:todo_list/todo_feature/model/todo_model.dart';
import 'package:todo_list/tools/popup/awesome_alert.dart';
import 'package:todo_list/tools/popup/snack_bar_widget.dart';
import 'package:todo_list/tools/text_form_fileds/text_form_field_multi_line.dart';
import 'package:todo_list/tools/text_form_fileds/text_form_field_name.dart';
import 'package:todo_list/tools/theme/colors.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Jalali? picker;

  void pickDate() async {
    final now = Jalali.now();
    picker = await showPersianDatePicker(
      context: context,
      initialDate: picker ?? now,
      firstDate: now,
      lastDate: now.copy(
        year: now.year + 10,
        month: 1,
        day: 1,
        hour: 0,
        minute: 0,
        second: 0,
      ),
    );
    setState(() {});
  }

  void submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (picker == null) {
      alertDialogError(
        context: context,
        title: 'خطا در افروزدن',
        desc: 'لطفا تاریخ انجام را مشخص کنید!',
      );
      return;
    }
    context.read<TodoBloc>().add(
          AddTaskTodoEvent(
            todoModel: TodoModel(
              title: _titleController.text,
              description: _descriptionController.text,
              goalDate: TodoModel.jalaliToString(picker!),
            ),
          ),
        );
    context.go('/');
    getSnackBarWidget(context, 'وظیفه با موفقیت ثبت شد.', Colors.green);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormFieldNameWidget(
                  maxLength: 100,
                  labelText: 'عنوان',
                  icon: const Icon(Icons.edit_outlined),
                  textInputAction: TextInputAction.next,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  controller: _titleController,
                ),
                const SizedBox(height: 5),
                TextFormFieldMultiLine(
                  labelText: 'عنوان',
                  icon: const Icon(Icons.edit_outlined),
                  textInputAction: TextInputAction.next,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  controller: _descriptionController,
                  minLine: 5,
                  maxLine: 8,
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: pickDate,
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(screenSize.width, 40),
                    backgroundColor: textFieldColor,
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    picker == null
                        ? 'تاریخ انجام'
                        : '${picker!.year}/${picker!.month}/${picker!.day}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(screenSize.width, 40),
                  ),
                  child: const Text('ثبت وظیفه'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

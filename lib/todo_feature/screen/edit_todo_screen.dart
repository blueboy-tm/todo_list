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

class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen(
      {super.key, required this.index, required this.todoModel});
  final int index;
  final TodoModel todoModel;

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late final TextEditingController _titleController = TextEditingController(
    text: widget.todoModel.title,
  );
  late final TextEditingController _descriptionController =
      TextEditingController(
    text: widget.todoModel.description,
  );
  final _formKey = GlobalKey<FormState>();
  late Jalali? picker;

  @override
  void initState() {
    picker = TodoModel.dateToJalali(widget.todoModel.goalDate);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void pickDate() async {
    final now = Jalali.now();
    picker = await showPersianDatePicker(
      context: context,
      initialDate: picker ?? now,
      firstDate: picker ?? now,
      lastDate: (picker ?? now).copy(
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
          EditTaskTodoEvent(
            index: widget.index,
            todoModel: TodoModel(
              id: widget.todoModel.id,
              isDone: widget.todoModel.isDone,
              submitDate: widget.todoModel.submitDate,
              title: _titleController.text,
              description: _descriptionController.text,
              goalDate: TodoModel.jalaliToString(picker!),
            ),
          ),
        );
    context.go('/');
    getSnackBarWidget(
      context,
      'وظیفه با موفقیت تغییر یافت.',
      Colors.orange.shade300,
    );
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/todo_feature/logic/bloc/todo_bloc.dart';
import 'package:todo_list/todo_feature/model/todo_model.dart';
import 'package:todo_list/tools/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/tools/theme/theme.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Database
  if (!kIsWeb) {
    final directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
  } else {
    await Hive.initFlutter();
  }
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todoBox');

  runApp(BlocProvider(
    create: (context) => TodoBloc(),
    child: const TodoListApp(),
  ));
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Todo list',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persian
      ],
      locale: const Locale('fa'),
      theme: CustomTheme.lightTheme,
    );
  }
}

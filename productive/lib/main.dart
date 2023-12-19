import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/assets/constants/routes.dart';
import 'package:productive/features/notes/notes/data/repository/notes.dart';
import 'package:productive/features/notes/notes/presentation/bloc/notes/notes_bloc.dart';
import 'package:productive/features/tasks/data/repository/task.dart';
import 'package:productive/features/tasks/presentation/bloc/task_bloc.dart';

import 'assets/theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => TaskBloc(response: TaskRepository())),
          BlocProvider(create: (context)=>NoteBloc(repository: NoteRepository(),),)    
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Productive',
          theme: AppTheme.darkTheme(),
          navigatorKey: _navigatorKey,
          onGenerateRoute: RouteGenerator.onGenerateRoute,
        ),
      );
}

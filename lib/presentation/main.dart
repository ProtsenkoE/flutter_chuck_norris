import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chuck_norris/domain/repository/repository.dart';
import 'package:flutter_chuck_norris/presentation/home/bloc/joke_bloc.dart';
import 'package:flutter_chuck_norris/presentation/main_screen.dart';
import 'package:get_it/get_it.dart';

import 'common/bloc/app_bloc_obsever.dart';
import 'package:flutter_chuck_norris/di.dart';

Future<void> main() async {
  await BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      EquatableConfig.stringify = true;
      await initDi();

      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

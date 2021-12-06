import 'package:flutter_chuck_norris/data/network_service.dart';
import 'package:flutter_chuck_norris/presentation/home/bloc/joke_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/store/jokes_store.dart';
import 'domain/repository/repository.dart';

Future<void> initDi() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton(() => NetworkService('api.chucknorris.io'));
  getIt.registerLazySingleton(() => JokesStore(getIt.get()));
  getIt.registerLazySingleton(() => JokesRepositoryIml(getIt.get()));
  getIt.registerLazySingleton(() => JokeBloc(getIt.get()));
}

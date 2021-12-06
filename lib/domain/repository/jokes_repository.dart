import 'package:flutter_chuck_norris/data/model/mapper/joke_mapper.dart';
import 'package:flutter_chuck_norris/data/store/jokes_store.dart';
import 'package:flutter_chuck_norris/domain/model/models.dart';

abstract class JokesRepository {
  Future<Joke> getRandomJoke();
}

class JokesRepositoryIml implements JokesRepository {
  final JokesStore jokesStore;

  JokesRepositoryIml(this.jokesStore);

  @override
  Future<Joke> getRandomJoke() async {
    var jokeEntity = await jokesStore.getRandomJoke();
    return JokeMapper.toDomain(jokeEntity);
  }
}

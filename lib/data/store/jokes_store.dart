import 'package:flutter_chuck_norris/data/model/joke_entity.dart';
import 'package:flutter_chuck_norris/data/network_service.dart';

class JokesStore {
  final NetworkService networkService;

  JokesStore(this.networkService);

  Future<JokeEntity> getRandomJoke() async {
    return await networkService.getRandomJoke();
  }
}

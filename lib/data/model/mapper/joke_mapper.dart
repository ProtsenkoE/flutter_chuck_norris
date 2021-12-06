import 'package:flutter_chuck_norris/data/model/models.dart';
import 'package:flutter_chuck_norris/domain/model/models.dart';

class JokeMapper {
  static Joke toDomain(JokeEntity entity) => Joke(
        imageUrl: entity.imageUrl,
        joke: entity.joke,
      );
}

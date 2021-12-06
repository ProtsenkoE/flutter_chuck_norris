class JokeEntity {
  final String imageUrl;
  final String joke;

  const JokeEntity({
    required this.imageUrl,
    required this.joke,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JokeEntity &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          joke == other.joke);

  @override
  int get hashCode => imageUrl.hashCode ^ joke.hashCode;

  @override
  String toString() {
    return 'Joke{imageUrl: $imageUrl,joke: $joke}';
  }

  JokeEntity copyWith({
    String? imageUrl,
    String? joke,
  }) {
    return JokeEntity(
      imageUrl: imageUrl ?? this.imageUrl,
      joke: joke ?? this.joke,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icon_url': imageUrl,
      'value': joke,
    };
  }

  factory JokeEntity.fromMap(Map<String, dynamic> map) {
    return JokeEntity(
      imageUrl: map['icon_url'] as String,
      joke: map['value'] as String,
    );
  }
}

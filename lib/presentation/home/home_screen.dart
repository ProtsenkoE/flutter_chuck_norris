import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chuck_norris/domain/model/models.dart';
import 'package:flutter_chuck_norris/presentation/error/error_screen.dart';
import 'package:flutter_chuck_norris/presentation/home/bloc/joke_bloc.dart';
import 'package:flutter_chuck_norris/presentation/progress/progress_screen.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var bloc = GetIt.instance.get<JokeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeBloc, JokeState>(
      bloc: bloc,
      builder: (_, state) {
        switch (state.status) {
          case JokeStatus.success:
            return HomeContent(
                joke: state.joke,
                onRefresh: () => bloc.add(const LoadJokeEvent()));
          case JokeStatus.failure:
            return const ErrorScreen();
          default:
            return const ProgressScreen();
        }
      },
    );
  }
}

class HomeContent extends StatelessWidget {
  final Joke joke;
  final Function onRefresh;

  const HomeContent({
    Key? key,
    required this.joke,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(joke.imageUrl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              joke.joke,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          MaterialButton(
            color: Colors.pink,
            onPressed: () {
              onRefresh();
            },
            child: const Text(
              'Refresh',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}

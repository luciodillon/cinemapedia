import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    final moviesSlideshow = ref.watch(moviesSlideshowProvider);

    if (moviesSlideshow.isEmpty) return CircularProgressIndicator();

    return Column(
      children: [
        CustomAppbar(),
        MoviesSlideshow(movies: moviesSlideshow),
        MoviesHorizontalListview(
          movies: nowPlayingMovies,
          title: 'En cines',
          subTitle: 'Jueves 12',
          loadNextPage: () => 
            ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
        )
      ],
    );
  }
}

import 'package:pipoca_filmes/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class GetPopularMoviesList {
  final MovieRepository movieRepository;

  GetPopularMoviesList({required this.movieRepository});

  Future<List<MovieEntity>> call() async {
    return await movieRepository.getPopularMoviesList();
  }
}

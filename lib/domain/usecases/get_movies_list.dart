import 'package:pipoca_filmes/domain/entities/movie_entity.dart';
import 'package:pipoca_filmes/domain/repositories/movie_repository.dart';

class GetTrendingMoviesList {
  final MovieRepository movieRepository;

  GetTrendingMoviesList({required this.movieRepository});

  Future<List<MovieEntity>> call() async {
    return await movieRepository.getTrendingMoviesList();
  }
}

import 'package:pipoca_filmes/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getTrendingMoviesList();
  Future<List<MovieEntity>> searchMovies(String query);
  Future<List<MovieEntity>> getPopularMoviesList();
}

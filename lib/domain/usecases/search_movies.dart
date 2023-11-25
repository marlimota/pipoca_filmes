import 'package:pipoca_filmes/domain/entities/movie_entity.dart';
import 'package:pipoca_filmes/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository movieRepository;

  SearchMovies({required this.movieRepository});

  Future<List<MovieEntity>> call(String query) async {
    return await movieRepository.searchMovies(query);
  }
}

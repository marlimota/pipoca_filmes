import 'package:pipoca_filmes/data/datasources/movie_remote_datasource.dart';
import 'package:pipoca_filmes/data/models/movie_model.dart';
import 'package:pipoca_filmes/domain/entities/movie_entity.dart';
import 'package:pipoca_filmes/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MovieEntity>> getPopularMoviesList() async {
    final List<MovieModel> movieModels =
        await remoteDataSource.getPopularMovies();
    final List<MovieEntity> movies = movieModels.toList();
    return movies;
  }

  @override
  Future<List<MovieEntity>> getTrendingMoviesList() async {
    final List<MovieModel> movieModels =
        await remoteDataSource.getTrendingMovies();
    final List<MovieEntity> movies = movieModels.toList();
    return movies;
  }

  @override
  Future<List<MovieEntity>> searchMovies(String query) async {
    final List<MovieModel> movieModels =
        await remoteDataSource.searchMovies(query);
    final List<MovieEntity> movies = movieModels.toList();
    return movies;
  }
}

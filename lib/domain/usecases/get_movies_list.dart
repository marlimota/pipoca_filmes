import 'package:dartz/dartz.dart';
import 'package:pipoca_filmes/domain/entities/movie_entity.dart';
import 'package:pipoca_filmes/domain/repositories/movie_repository.dart';

import '../../core/failures/failures.dart';

class GetMoviesList {
  final MovieRepository movieRepository;

  GetMoviesList({required this.movieRepository});

  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await movieRepository.getMoviesList();
  }
}

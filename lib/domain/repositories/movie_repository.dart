import 'package:dartz/dartz.dart';
import 'package:pipoca_filmes/domain/entities/movie_entity.dart';

import '../../core/failures/failures.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getMoviesList();
}

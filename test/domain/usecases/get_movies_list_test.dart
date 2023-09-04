import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pipoca_filmes/domain/entities/movie_entity.dart';
import 'package:pipoca_filmes/domain/usecases/get_movies_list.dart';

void main() {
  late MockMovieRepository mockMovieRepository;
  List<MovieEntity> mockMovie;
  late GetMoviesList usecase;

  setUp(
    () {
      mockMovieRepository = mockMovieRepository();
      usecase = GetMoviesList(movieRepository: mockMovieRepository);
    },
  );

  test('should get movies data info from the repository', () async {
    when(mockMovieRepository.getMoviesList())
        .thenAnswer((_) async => Right(mockMovie));

    final result = await usecase.execute();

    expect(result, equals(Right(mockMovie)));
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pipoca_filmes/domain/entities/movie_entity.dart';
import 'package:pipoca_filmes/domain/usecases/get_movies_list.dart';

import '../../test_helper.mocks.mocks.dart';

//@GenerateMocks([MockSpec<MovieRepository>()])

void main() {
  late GetTrendingMoviesList usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(
    () {
      mockMovieRepository = MockMovieRepository();
      usecase = GetTrendingMoviesList(movieRepository: mockMovieRepository);
    },
  );

  final tMoviesList = [
    MovieEntity(
        adult: true,
        backdropPath: "backdropPath",
        genreIds: const [],
        id: 1,
        originalLanguage: "originalLanguage",
        originalTitle: "originalTitle",
        overview: "overview",
        popularity: 2,
        posterPath: "posterPath",
        releaseDate: DateTime.now(),
        title: "title",
        video: false,
        voteAverage: 5,
        voteCount: 500),
    MovieEntity(
        adult: true,
        backdropPath: "backdropPath",
        genreIds: const [],
        id: 1,
        originalLanguage: "originalLanguage",
        originalTitle: "originalTitle",
        overview: "overview",
        popularity: 2,
        posterPath: "posterPath",
        releaseDate: DateTime.now(),
        title: "title",
        video: false,
        voteAverage: 5,
        voteCount: 500),
  ];

  test('should get movies List info from the repository', () async {
    when(mockMovieRepository.getTrendingMoviesList())
        .thenAnswer((_) async => tMoviesList);

    final result = await usecase.call();

    expect(result, equals(tMoviesList));
  });
}

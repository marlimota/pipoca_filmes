import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:pipoca_filmes/domain/entities/movie_entity.dart';

import 'package:pipoca_filmes/domain/usecases/search_movies.dart';

import 'get_popular_movies_list_test.mocks.dart';

void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(movieRepository: mockMovieRepository);
  });

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
        releaseDate: DateTime.now().toIso8601String(),
        title: "title",
        video: false,
        voteAverage: 5,
        voteCount: 500),
    const MovieEntity(
        adult: true,
        backdropPath: "backdropPath",
        genreIds: [],
        id: 1,
        originalLanguage: "originalLanguage",
        originalTitle: "originalTitle",
        overview: "overview",
        popularity: 2,
        posterPath: "posterPath",
        releaseDate: '',
        title: "title",
        video: false,
        voteAverage: 5,
        voteCount: 500),
  ];

  const tquery = 'avangers';
  test('should get movies from the query from the repository', () async {
    when(mockMovieRepository.searchMovies(tquery))
        .thenAnswer((_) async => tMoviesList);

    final result = await usecase(tquery);

    expect(result, equals(tMoviesList));
    verify(mockMovieRepository.searchMovies(tquery));
  });
}

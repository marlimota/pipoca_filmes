import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pipoca_filmes/domain/entities/movie_entity.dart';
import 'package:pipoca_filmes/domain/usecases/get_trending_movies_list.dart';

import 'get_popular_movies_list_test.mocks.dart';

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
        releaseDate: "",
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
        releaseDate: "",
        title: "title",
        video: false,
        voteAverage: 5,
        voteCount: 500),
  ];

  test('should get trending movies List info from the repository', () async {
    when(mockMovieRepository.getTrendingMoviesList())
        .thenAnswer((_) async => tMoviesList);

    final result = await usecase.call();

    expect(result, equals(tMoviesList));
  });
}

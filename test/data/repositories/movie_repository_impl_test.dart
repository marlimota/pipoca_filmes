import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pipoca_filmes/data/datasources/movie_remote_datasource.dart';
import 'package:pipoca_filmes/data/models/movie_model.dart';
import 'package:pipoca_filmes/data/repositories/movie_repository_impl.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRepositoryImpl repository;
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    repository =
        MovieRepositoryImpl(remoteDataSource: mockMovieRemoteDataSource);
  });

  final tMovieModelList = [
    MovieModel(
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
  ];

  test('should get trending movies from the remote data source', () async {
    when(mockMovieRemoteDataSource.getTrendingMovies())
        .thenAnswer((_) async => tMovieModelList);

    final result = await repository.getTrendingMoviesList();

    verify(mockMovieRemoteDataSource.getTrendingMovies());

    expect(result, equals(tMovieModelList));
  });
}

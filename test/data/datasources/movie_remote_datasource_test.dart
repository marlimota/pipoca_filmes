import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:pipoca_filmes/core/errors/error.dart';
import 'package:pipoca_filmes/data/datasources/movie_remote_datasource_impl.dart';

import 'movie_remote_datasource_test.mocks.dart';

void main() {
  late MovieRemoteDataSourceImpl datasource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    datasource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  const trendingUrl =
      'http://api.themoviedb.org/3/trending/movie/day?api_key=aacc29faa6584fd592f31ad4e495babf';
  const popularUrl =
      'http://api.themoviedb.org/3/movie/popular?api_key=aacc29faa6584fd592f31ad4e495babf';

  const String sampleApiResponse = ''' 
{
  "page": 1,
  "results": [
    {
    "adult": true,
    "backdropPath": "/backdropPath",
    "genreIds": [1],
    "id": 1,
    "originalLanguage": "originalLanguage",
    "originalTitle": "avangers",
    "overview": "overview",
    "popularity": 2.0,
    "posterPath": "posterPath",
    "releaseDate": "2023-01-09",
    "title": "avangers",
    "video": false,
    "voteAverage": 5,
    "voteCount": 500
    }
  ],
  "total_pages":1000,
  "total_results":20000
  }
  ''';

  test('should perfom a GET request on a url to get trending movies', () async {
    when(mockHttpClient.get(Uri.parse(trendingUrl)))
        .thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    await datasource.getTrendingMovies();

    verify(mockHttpClient.get(Uri.parse(trendingUrl)));
  });

  test('should perfom a GET request on a url to get popular movies', () async {
    when(mockHttpClient.get(Uri.parse(popularUrl)))
        .thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    await datasource.getPopularMovies();

    verify(mockHttpClient.get(Uri.parse(popularUrl)));
  });
  test('should throw a ServerException when the response code is 404',
      () async {
    when(mockHttpClient.get(Uri.parse(trendingUrl)))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));

    final call = datasource.getTrendingMovies();

    expect(() => call, throwsA(isA<ServerException>()));
  });
}

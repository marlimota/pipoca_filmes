import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:pipoca_filmes/domain/repositories/movie_repository.dart';

@GenerateMocks(
  [
    MovieRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/config/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/config/infrastructure/models/credits_response.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.theMovieDbKey,
    'language': 'es-MX',
  }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castRepsonse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castRepsonse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}

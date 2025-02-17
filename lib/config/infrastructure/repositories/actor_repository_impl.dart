import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actor_repository.dart';

class ActorRepositoryImpl extends ActorRepository{

  final ActorsDatasource datasource;

  ActorRepositoryImpl(
    this.datasource
    );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
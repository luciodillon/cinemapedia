

import 'package:cinemapedia/config/infrastructure/models/credits_response.dart';
import '../../../domain/entities/actor.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    : 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhh0KQVofH8PF5D-6ftUhrc-fTrvluxLkdAIdepSQFi3zBjM49ILYkS9XOCoK2cWxp7TuugJpY9zaFALvRumKklTtVIcQDmX66CtE3cJ057k4GIHz5T6Du_JUAwlvDtnKfhCs_I29of84GJ/s1600/facebook-default-no-profile-pic.jpg', 
    character: cast.character
  );
}
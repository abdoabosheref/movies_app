import 'package:movies_app/api/models/movie_details/cast_dto.dart';
import 'package:movies_app/domain/entities/movie_details/cast.dart';

extension CastMapper on CastDto {
  Cast toCast() {
    return Cast(
      name: name,
      characterName: characterName,
      urlSmallImage: urlSmallImage,
    );
  }
}


import '../../vos/movie_vo/movie_vo.dart';

abstract class MovieDBApply{

  ///For Network
  Future<List<MovieVO>?>getNowPlayingMovies(int page);


/// For DataBase

}
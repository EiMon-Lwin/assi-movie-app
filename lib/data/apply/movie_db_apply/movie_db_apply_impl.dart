


import '../../../network/data_agent/movie_data_agent/movie_data_agent.dart';
import '../../../network/data_agent/movie_data_agent/movie_data_agent_impl.dart';
import '../../vos/movie_vo/movie_vo.dart';
import 'movie_db_apply.dart';

class MovieDBApplyImpl extends MovieDBApply{

  MovieDBApplyImpl._();

  static final MovieDBApplyImpl _singleton=MovieDBApplyImpl._();

  factory MovieDBApplyImpl()=>_singleton;

  final MovieDataAgent _movieDataAgent=MovieDataAgentImpl();

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) =>_movieDataAgent.getNowPlaying(page).then((value) {

    final temp=value?.map((e) {
      e.isGetNowPlaying=true;
      return e;
    }).toList();
    return temp;
  });

}
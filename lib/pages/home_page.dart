import 'package:assi_movie_app/widgets/easy_text_widget.dart';
import 'package:flutter/material.dart';

import '../constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../constant/strings.dart';
import '../data/apply/movie_db_apply/movie_db_apply.dart';
import '../data/apply/movie_db_apply/movie_db_apply_impl.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../widgets/gradient_container_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieDBApply movieDBApply = MovieDBApplyImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.search),SizedBox(
          width: kSearchIconSpace,
        )],
        centerTitle: true,
        backgroundColor: kAppBarColor,
        title: const Text(kAppBarText),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SizedBox(
              height: kBannerSectionHeight300x,
              child: FutureBuilder<List<MovieVO>?>(
                  future: movieDBApply.getNowPlayingMovies(1),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    if (snapShot.hasError) {
                      return const Center(child: Text(kErrorText),);
                    }
                    final listMovieBanner = snapShot.data?.take(kBannerSectionImageCount).toList();
                    return PageView.builder(
                        itemCount: listMovieBanner?.length,
                        itemBuilder: (context, index) =>
                            BannerMovieItemView(
                                movieVO: listMovieBanner?[index])
                    );
                  }
              ),


            )
          ],
        ),
      ),
    );
  }
}

class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView({Key? key, required this.movieVO})
      : super(key: key);
  final MovieVO ? movieVO;

  @override
  Widget build(BuildContext context) {
    var image = movieVO?.backdropPath ?? '';
    String title=movieVO?.title?? '';
    return
      SizedBox(
        width: double.infinity,
        height: kBannerMoviesImageHeight300x,
        child: Stack(children: [
          SizedBox(
              width: double.infinity,
              height: kBannerMoviesImageHeight300x,
              child: Image.network('$kPrefixImageLink$image',fit: BoxFit.cover,)
          ),
          const GradientContainerWidget(),
          Padding(
              padding: const EdgeInsets.only(top: kBannerMoviesTitlePadding230x),
              child: EasyTextWidget(text: title,)
          ),
          const Padding(
              padding: EdgeInsets.only(top: kOfficialReviewStringPadding260x),
              child:EasyTextWidget(text: kOfficialReviewText,)
          ),
          const Center(child: Icon(Icons.play_circle,color: kPlayButtonColor,size: kPlayCircleIconSize,)),


        ]),
      );
  }
}


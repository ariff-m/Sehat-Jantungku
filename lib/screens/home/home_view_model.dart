import 'package:sehatjantungku/model/home_page_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreenViewModel {
  final HomePageModel homePageModel = HomePageModel();
  final YoutubePlayerController ytControl = YoutubePlayerController(
    initialVideoId: 'lgkwjHYJEGQ',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      hideThumbnail: true,
    ),
  );

  final YoutubePlayerController ytControl2 = YoutubePlayerController(
    initialVideoId: 'xn8_7BC9iac',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      hideThumbnail: true,
    ),
  );
}

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePageViewModel {
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

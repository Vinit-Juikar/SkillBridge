import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:video_player/video_player.dart';

class exploreProviderHomeScreen extends StatelessWidget {
  List<String> videoUrls = [
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    "assets/providerAssets/videos/Images_0.mp4",
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    "assets/providerAssets/videos/Images_1.mp4",
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    "assets/providerAssets/videos/Images_2.mp4",
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    "assets/providerAssets/videos/Images_3.mp4",
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    "assets/providerAssets/videos/Images_4.mp4",
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
  ];

  exploreProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: masonryLayout(context),
      ),
    );
  }

  Widget masonryLayout(BuildContext context) {
    return MasonryGridView.builder(
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      gridDelegate:
          const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index % 2 == 0) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/providerAssets/explore/Images_$index.jpg".toString(),
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return ChewieListItem(
            looping: true,
            key: UniqueKey(),
            videoPlayerController:
                VideoPlayerController.asset(videoUrls[index]),
          );
        }
      },
    );
  }
}

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  const ChewieListItem({
    @required required this.videoPlayerController,
    required this.looping,
    required Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoPlay: false,
      looping:  true,
      // aspectRatio: 16 / 9,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
    widget.videoPlayerController.dispose();
  }
}
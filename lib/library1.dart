import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class KGVidioPlayerOne extends StatefulWidget {
  KGVidioPlayerOne({Key? key, required this.title, required this.videoUrl}) : super (key: key);

  String title, videoUrl;
  @override
  State<KGVidioPlayerOne> createState() => _KGVidioPlayerOneState(title: title, videoUrl: videoUrl);
}

class _KGVidioPlayerOneState extends State<KGVidioPlayerOne> {
  _KGVidioPlayerOneState({required this.title, required this.videoUrl});
  
  YoutubePlayerController? _controller;
  bool? showAppBar = true;
  String title, videoUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoUrl = YoutubePlayer.convertUrlToId(videoUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoUrl,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        isLive: false
      )
    )..addListener(() {setState(() {
      showAppBar = _controller?.value.isFullScreen;
    });});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar! ? null : AppBar(
        title: Text('Vidio-ku'),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller!,
          showVideoProgressIndicator: true,
          progressColors: ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.red
          ),
        ),
        builder: (context, player) {
            return Column(
              children: [
                player,
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height*0.1,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Container(height: 20, color: Colors.grey[350],),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height*0.1,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text('lorem ipsum aaaaaaaaaaaaaaaaaaaa fddddddddddddddddddddd gggggggggggggggggggggg aaaaaaaaaaa eeeeeeeeeeeeeeeee')
                    ],
                  ),
                ),

              ],
            );
        },
      ),
    );
  }
}
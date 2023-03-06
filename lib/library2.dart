import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
class KGVidioPlayerTwo extends StatefulWidget {
  const KGVidioPlayerTwo({super.key});

  @override
  State<KGVidioPlayerTwo> createState() => _KGVidioPlayerTwoState();
}

class _KGVidioPlayerTwoState extends State<KGVidioPlayerTwo> {
  YoutubePlayerController? _controller;
  bool? showAppBar = true;
  String videoUrl = 'https://www.youtube.com/watch?v=3LI4qNS0rUs';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoUrl = YoutubePlayerController.convertUrlToId(videoUrl)!;
    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoUrl,
      autoPlay: false,
      params: YoutubePlayerParams(
        showFullscreenButton: true,
        showControls: true
      )
    )..setFullScreenListener((value) {
      setState(() {
        showAppBar = !showAppBar!;
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar! ? AppBar(
        title: Text('Vidio-ku')
      ) : null,
      body: YoutubePlayerScaffold(
        controller: _controller!,
        builder:(context, player) {
          return Column(
            children: [
              player,
              Container(
                  padding: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Modul 1 - Introduction', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Container(height: 20, color: Colors.grey[350],),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width,
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
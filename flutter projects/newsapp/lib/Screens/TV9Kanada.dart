import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveNewsPlayerKanada extends StatefulWidget {
  // const LiveNdews({ Key? key }) : super(key: key);

  @override
  _LiveNewsPlayerKanadaState createState() => _LiveNewsPlayerKanadaState();
}

class _LiveNewsPlayerKanadaState extends State<LiveNewsPlayerKanada> {
  @override
  void initState() {
    super.initState();
  }

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'jdJoOhqCipA',
    flags: YoutubePlayerFlags(
      isLive: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("News"),
                  Text(
                    "App",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  )
                ],
              )),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              child: YoutubePlayer(
                controller: _controller,
                liveUIColor: Colors.amber,
              ),
            ),
          ]),
        ));
  }
}

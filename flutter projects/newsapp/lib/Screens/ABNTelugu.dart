import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveNewsPlayerTelugu extends StatefulWidget {
  // const LiveNdews({ Key? key }) : super(key: key);

  @override
  _LiveNewsPlayerTeluguState createState() => _LiveNewsPlayerTeluguState();
}

class _LiveNewsPlayerTeluguState extends State<LiveNewsPlayerTelugu> {
  @override
  void initState() {
    super.initState();
  }

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'IKj_cj51_W0',
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
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.save)),
            )
          ],
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

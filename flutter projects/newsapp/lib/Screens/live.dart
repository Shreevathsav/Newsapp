import 'package:flutter/material.dart';
import 'package:newsapp/Screens/ABNTelugu.dart';
import 'package:newsapp/Screens/Asianet.dart';
import 'package:newsapp/Screens/IndiaTV.dart';
import 'package:newsapp/Screens/NDTV.dart';
import 'package:newsapp/Screens/Tamilnews.dart';
import 'package:newsapp/Screens/TV9Kanada.dart';
import 'package:newsapp/Utilities/LiveNews.dart';
import 'package:newsapp/DataModels/LiveData.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LiveNews extends StatefulWidget {
  // const LiveNdews({ Key? key }) : super(key: key);

  @override
  _LiveNewsState createState() => _LiveNewsState();
}

class _LiveNewsState extends State<LiveNews> {
  List<LiveTamil> liveNews = <LiveTamil>[];
  @override
  void initState() {
    super.initState();
    liveNews = getLiveChannel();
  }

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
            child: Container(
          child: Column(children: <Widget>[
            Container(
              child: ListView.builder(
                  itemCount: liveNews.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return NewsCategoryCard(
                        imgUrl: liveNews[index].imgUrl,
                        catName: liveNews[index].liveNewsName,
                        id: liveNews[index].liveUrl);
                  }),
            ),
          ]),
        )));
  }
}

class NewsCategoryCard extends StatelessWidget {
  final imgUrl, catName, id;
  NewsCategoryCard({this.imgUrl, this.catName, this.id});
  // const NewsCategoryCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (id == "JddGlT64N2s") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LiveNewsPlayerTamil()));
          } else if (id == "yKMT5aJl7yI") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LiveNewsPlayerEnglish()));
          } else if (id == "EZy0RAxG8OI") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LiveNewsPlayerHindi()));
          } else if (id == "wc3Y6vI-poI") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LiveNewsPlayerTelugu()));
          } else if (id == "aoBO8k2ti8c") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LiveNewsPlayerMalayalam()));
          } else if (id == "KjVno5SSwog") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LiveNewsPlayerKanada()));
          }
        },
        child: Container(
            padding: EdgeInsets.all(10.0),
            // margin: EdgeInsets.only(right: 7.5, left: 7.5),
            child: Stack(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: imgUrl,
                    width: 400.0,
                    height: 350.0,
                    fit: BoxFit.cover,
                  )),
            ])));
  }
}

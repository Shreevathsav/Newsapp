import 'package:flutter/material.dart';
import 'package:newsapp/DataModels/categoryData.dart';
import 'package:newsapp/Screens/news_category.dart';
import 'package:newsapp/Screens/news_web_view.dart';
import 'package:newsapp/Utilities/data.dart';
import 'package:newsapp/Utilities/news_http.dart';
import 'package:newsapp/DataModels/newsData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp/Screens/live.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  bool _showBacktoTop = false;
  bool _loading = true;
  String imageURL =
      "https://images.unsplash.com/photo-1613031729579-ace1feefda4c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  List<Category> categories = <Category>[];
  List<NewsData> newsDatas = <NewsData>[];
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    categories = getCategory();
    getNewsData();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBacktoTop = true;
          } else {
            _showBacktoTop = false;
          }
        });
      });
  }

  void _scrollTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.linear);
  }

  getNewsData() async {
    News newsonlineData = new News();
    await newsonlineData.getNewsArticles();
    newsDatas = newsonlineData.newsData;
    setState(() {
      _loading = false;
    });
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
        elevation: 0.0,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
              child: CircularProgressIndicator(),
            ))
          : SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return NewsCategoryCard(
                                imgUrl: categories[index].imgUrl,
                                catName: categories[index].catName);
                          }),
                    ),
                    ButtonTheme(
                        minWidth: double.infinity,
                        child: Padding(
                            padding: EdgeInsets.only(right: 15.0, left: 15.0),
                            child: MaterialButton(
                                color: Colors.orange,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LiveNews()));
                                },
                                child: Text('Watch Live Stream')))),
                    Container(
                      child: ListView.builder(
                          itemCount: newsDatas.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsBlog(
                              imagUrl: newsDatas[index].urlImage,
                              title: newsDatas[index].title,
                              description: newsDatas[index].description,
                              url: newsDatas[index].url,
                            );
                          }),
                    )
                  ],
                ),
              )),
      floatingActionButton: _showBacktoTop == false
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: _scrollTop,
              child: Icon(Icons.arrow_upward),
            ),
    );
  }
}

class NewsCategoryCard extends StatelessWidget {
  final imgUrl, catName;
  NewsCategoryCard({this.imgUrl, this.catName});
  // const NewsCategoryCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryNews(
                        category: catName.toString().toLowerCase(),
                      )));
        },
        child: Container(
            margin: EdgeInsets.only(right: 7.5, left: 7.5),
            child: Stack(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: imgUrl,
                    width: 130,
                    height: 60,
                    fit: BoxFit.cover,
                  )),
              Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black26,
                  ),
                  child: Text(
                    catName,
                    style: TextStyle(color: Colors.white),
                  ))
            ])));
  }
}

class NewsBlog extends StatelessWidget {
  // const NewsBlog({ Key? key }) : super(key: key);
  final imagUrl, title, description, url;
  NewsBlog(
      {@required this.imagUrl,
      @required this.title,
      @required this.description,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsWebView(
                        url: url,
                      )));
        },
        child: Container(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(imagUrl)),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(description, style: TextStyle(color: Colors.blueGrey)),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  thickness: 3.0,
                  color: Colors.grey,
                )
              ],
            )));
  }
}

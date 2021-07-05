import 'package:flutter/material.dart';
import 'package:newsapp/Utilities/news_category_http.dart';
import 'package:newsapp/DataModels/newsData.dart';
import 'news_web_view.dart';

class CategoryNews extends StatefulWidget {
  // const CategoryNews({Key? key}) : super(key: key);
  final category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  bool _showBacktoTop = false;
  bool _loading = true;
  List<NewsData> newsDatas = <NewsData>[];
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
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
    NewsCategory newsonlineData = new NewsCategory();
    await newsonlineData.getNewsCategoryArticles(widget.category);
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
      body: _loading
          ? Center(
              child: Container(
              child: CircularProgressIndicator(),
            ))
          : SingleChildScrollView(
              controller: _scrollController,
              child: Container(
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
              ),
            ),
      floatingActionButton: _showBacktoTop == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollTop,
              child: Icon(Icons.arrow_upward),
            ),
    );
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

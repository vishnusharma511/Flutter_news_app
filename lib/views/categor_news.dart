import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';

import 'article_view.dart';

class CategorNews extends StatefulWidget {

  final String categor;
  CategorNews({this.categor});

  @override
  _CategorNewsState createState() => _CategorNewsState();
}

class _CategorNewsState extends State<CategorNews> {

  List<ArticleModel>articles =new List<ArticleModel>();

  bool _loading =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategorieNews();
  }

  getCategorieNews() async{
    CategorNewsClass newsClass =CategorNewsClass();
    await newsClass.getNews(widget.categor);
    articles =newsClass.news;
    setState(() {
      _loading =false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Letest"),
            Text("News",style: TextStyle(
                color: Colors.blue
            ),),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0
              ),
              child: Icon(
                  Icons.save
              ),
            ),
          )
        ],
        elevation: 0.0,
      ),
      body: _loading ?
      Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              /// blogggg
              Container(
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    // physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class BlogTile extends StatelessWidget {

  final String imageUrl ,title ,desc ,url;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>ArticleView(
          blogUrl: url,

        )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(imageUrl ),
            ),
            SizedBox(height: 8.0,),
            Text(title ,style: TextStyle(
              color: Colors.black,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(height: 8.0,),
            Text(desc ,style: TextStyle(
                color: Colors.black54
            ),)
          ],
        ),
      ),
    );
  }
}
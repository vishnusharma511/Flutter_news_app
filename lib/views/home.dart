import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/categor_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/categor_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategorModel> categories =new List<CategorModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategor();
    getNews();
  }

  getNews() async{
    News newsClass =News();
    await newsClass.getNews();
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
        elevation: 0.0,
      ),
      body: _loading ? 
      Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) :SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              /// Categories
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return CategorTile(
                        imageUrl:categories[index].imageUrl,
                      categorName: categories[index].categorName,
                    );
                  },
                ),
              ),
              /// Blogs
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

class CategorTile extends StatelessWidget {

  final String imageUrl ,categorName;
  CategorTile({this.imageUrl, this.categorName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Temporar   tap function
        // final snackBar = SnackBar(content: Text(categorName + " was cliked"));
        // Scaffold.of(context).showSnackBar(snackBar);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategorNews(
          categor: categorName.toLowerCase(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,width: 120.0,height: 60.0,fit: BoxFit.cover,)
            ),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.black26,
              ),
              child: Text(
                categorName,style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
              ),
            )
          ],
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

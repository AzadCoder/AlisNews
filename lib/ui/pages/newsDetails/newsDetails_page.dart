import 'package:AlisNews/models/news_model.dart';
import 'package:flutter/material.dart';
//widgets
import '../../widgets/shimmerImage_widget.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails(this.news);
  final NewsModel news;
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  bool _readMoreMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 5),
          child: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            // title: Text("NewsDetails"),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.bookmark_outline,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: _readMoreMode == true
                ? NeverScrollableScrollPhysics()
                : BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerImage(
                    size: Size(double.infinity, 200),
                    url: "${widget.news.urlToImage}",
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${widget.news.title}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "${widget.news.source.name}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${widget.news.content}",
                    maxLines: _readMoreMode == true ? 20 : null,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
          _readMoreMode == true
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: 20, left: 20, right: 20, top: 50),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: RaisedButton(
                      padding: EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "READ MORE",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              color: Colors.white70,
                            ),
                      ),
                      onPressed: () {
                        setState(() {
                          _readMoreMode = false;
                        });
                      },
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

import 'package:AlisNews/blocs/mainBloc_bloc.dart';
import 'package:AlisNews/models/news_model.dart';
import 'package:flutter/material.dart';
//widgets
import './widgets/cardItem_widget.dart';
import '../../widgets/newsListItem_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final mainBloc = new MainBloc();
  List<NewsModel> _newsList = [];
  @override
  void initState() {
    mainBloc.fetchTopNews();
    mainBloc.listen((news) {
      setState(() {
        _newsList = news;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: _newsList.isEmpty != true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).accentColor,
                      padding:
                          const EdgeInsets.only(left: 25, top: 20, bottom: 10),
                      child: Text("Alis News",
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 6),
                              blurRadius: 5,
                            ),
                          ]),
                      height: 240,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          if (index == 0 || index == 19) {
                            return SizedBox(width: 15);
                          }
                          return CardItem(_newsList[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recommended",
                              style: Theme.of(context).textTheme.headline1),
                          SizedBox(height: 10),
                          ListView.builder(
                            // itemExtent: 100,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index < 20) {
                                return Container();
                              }
                              return NewsListItem(_newsList[index]);
                            },
                            itemCount: _newsList.length,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

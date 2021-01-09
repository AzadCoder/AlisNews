import 'package:AlisNews/blocs/mainBloc_bloc.dart';
import 'package:AlisNews/models/news_model.dart';
import 'package:AlisNews/utilities/allUtilities.dart';
import 'package:flutter/material.dart';
//widgets
import './widgets/cardItem_widget.dart';
import '../../widgets/newsListItem_widget.dart';
//const
import '../../../const/news_const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final mainBloc = new MainBloc();
  List<NewsModel> _newsList = [];
  StateOfNews _stateOfNews = StateOfNews.LOADING;

  //Making categories chips
  int _selectedIndex = 0;
  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < newsCategories.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
        selected: _selectedIndex == i,
        label: Text(newsCategories[i], style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).accentColor,
        selectedColor: Theme.of(context).buttonColor,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
              mainBloc.fetchNewsByCategory(newsCategories[i]);
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 5), child: choiceChip));
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  } //ChipsBuilder End

  @override
  void initState() {
    mainBloc.fetchTopNews();
    mainBloc.listen((state) {
      setState(() {
        _stateOfNews = state;
        _newsList = mainBloc.newsList;
        print("news list.lenght ${_newsList.length}");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  height: 30,
                  child: _buildChips(),
                ),
              ),
              _newsList.isEmpty != true
                  ? Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Theme.of(context).accentColor,
                          padding: const EdgeInsets.only(
                              left: 25, top: 20, bottom: 10),
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
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              if (index == 0 || index == 9) {
                                return SizedBox(width: 15);
                              }
                              return CardItem(_newsList[index]);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("Recommended",
                              //     style: Theme.of(context).textTheme.headline1),
                              // SizedBox(height: 10),
                              ListView.builder(
                                // itemExtent: 100,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if (index < 10) {
                                    return Container();
                                  }
                                  return NewsListItem(_newsList[index]);
                                },
                                itemCount: _newsList.length,
                              ),
                              _stateOfNews == StateOfNews.FINISHED
                                  ? Container(
                                      child: Text("OOps! Can't load more."),
                                    )
                                  : SizedBox(
                                      width: ScreenSize().width(context, 100),
                                      child: RaisedButton(
                                        padding: EdgeInsets.all(18),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child:
                                            _stateOfNews == StateOfNews.LOADING
                                                ? CircularProgressIndicator()
                                                : Text(
                                                    "Load More",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2
                                                        .copyWith(
                                                          color: Colors.white70,
                                                        ),
                                                  ),
                                        onPressed: () {
                                          mainBloc.fetchTopNews(
                                            newsCategories[_selectedIndex],
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

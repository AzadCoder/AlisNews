import 'package:AlisNews/utilities/allUtilities.dart';
import 'package:flutter/material.dart';
//const
import '../../../const/news_const.dart';
//model
import 'package:AlisNews/models/news_model.dart';
//widget
import 'package:AlisNews/ui/widgets/newsListItem_widget.dart';
//bloc
import '../../../blocs/mainBloc_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _countryDropDownEnabled = false;
  bool _languageDropDownEnabled = false;
  String _country;
  String _language;
  String _searchInput;
  StateOfNews _stateOfNews = StateOfNews.NOT_SEARCHED;
  List<NewsModel> _newsList;
  final _searchCubit = new SearchCubit();
  @override
  void initState() {
    _searchCubit.listen((state) {
      setState(() {
        _stateOfNews = state;
        _newsList = _searchCubit.newsList;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _countryDropDownEnabled = false;
          _languageDropDownEnabled = false;
          FocusScope.of(context).unfocus();
        });
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _searchInput = value;
                                if (value == '') {
                                  _searchInput = null;
                                }
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Search",
                              fillColor: Theme.of(context).accentColor,
                              filled: true,
                              contentPadding: EdgeInsets.only(left: 15),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).buttonColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: Container(
                            height: 32,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              border: Border.all(
                                width: 1,
                                color: _countryDropDownEnabled == true
                                    ? Theme.of(context).buttonColor
                                    : Colors.grey[900],
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: DropdownButton(
                              hint: Text("Select Country"),
                              value: _country,
                              onTap: () {
                                setState(() {
                                  FocusScope.of(context).unfocus();
                                  _countryDropDownEnabled = true;
                                  FocusScope.of(context).unfocus();
                                });
                              },
                              items: newsCountries
                                  .map(
                                    (country) => DropdownMenuItem(
                                      value: country,
                                      child: Text(country),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (item) {
                                setState(() {
                                  _country = item;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: Container(
                            height: 32,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              border: Border.all(
                                width: 1,
                                color: _languageDropDownEnabled == true
                                    ? Theme.of(context).buttonColor
                                    : Colors.grey[900],
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: DropdownButton(
                              hint: Text("Select Lang..."),
                              value: _language,
                              onTap: () {
                                setState(() {
                                  FocusScope.of(context).unfocus();
                                  _languageDropDownEnabled = true;
                                  FocusScope.of(context).unfocus();
                                });
                              },
                              items: newsLanguages
                                  .map(
                                    (lang) => DropdownMenuItem(
                                      value: lang,
                                      child: Text(lang),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (item) {
                                setState(() {
                                  _language = item;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: RaisedButton(
                            child: Text("Go"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            onPressed: _searchInput != null ||
                                    _country != null ||
                                    _language != null
                                ? () {
                                    print("clicked");
                                    _searchCubit.searchNews(
                                      query: _searchInput,
                                      language: _language,
                                      country: _country,
                                    );
                                  }
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _stateOfNews == StateOfNews.LOADING
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                      : _stateOfNews == StateOfNews.NOT_SEARCHED
                          ? Center(
                              child: Text("Search something to show here."),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return NewsListItem(_newsList[index]);
                              },
                              itemCount: _newsList.length,
                            ),
                  SizedBox(height: 15),
                  _stateOfNews == StateOfNews.FINISHED
                      ? Center(
                          child: Text("Oops: I Can't Load More. It's finished"),
                        )
                      : _stateOfNews == StateOfNews.NOTHING_FOUND
                          ? Center(
                              child: Text("Nothing Found!! Try Another Search"))
                          : _stateOfNews == StateOfNews.NOT_SEARCHED
                              ? Container()
                              : _stateOfNews == StateOfNews.LOADING
                                  ? Container()
                                  : SizedBox(
                                      height: 40,
                                      width: ScreenSize().width(context, 100),
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: _stateOfNews ==
                                                StateOfNews.LOADING_MORE
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation(
                                                        Colors.white),
                                              )
                                            : Text(
                                                "Load More",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2
                                                    .copyWith(
                                                        color: Colors.white70),
                                              ),
                                        onPressed: () {
                                          _searchCubit.loadMoreNews(
                                            query: _searchInput,
                                            language: _language,
                                            country: _country,
                                          );
                                        },
                                      ),
                                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

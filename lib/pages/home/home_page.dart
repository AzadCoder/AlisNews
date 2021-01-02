import 'package:flutter/material.dart';
//widgets
import './widgets/cardItem_widget.dart';
import '../../widgets/newsListItem_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   titleSpacing: 0.0,
        //   title: Padding(
        //     padding: const EdgeInsets.only(left: 25, top: 10),
        //     child:
        //         Text("Alis News", style: Theme.of(context).textTheme.headline1),
        //   ),
        // bottom: PreferredSize(
        //   preferredSize: Size(ScreenSize().width(context, 100), 240),
        //   child:
        // ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Theme.of(context).accentColor,
                padding: const EdgeInsets.only(left: 25, top: 20, bottom: 10),
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
                    return CardItem();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                        return NewsListItem();
                      },
                      itemCount: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

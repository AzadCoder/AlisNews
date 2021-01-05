//Core
import 'package:AlisNews/models/news_model.dart';

import '../../newsDetails/newsDetails_page.dart';
import 'package:flutter/material.dart';
//Widgets
import '../../../widgets/shimmerImage_widget.dart';

class CardItem extends StatelessWidget {
  CardItem(NewsModel this.news);
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return NewsDetails();
            },
          ),
        );
      },
      child: Container(
        width: 250,
        height: 240,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerImage(
              url:
                  "${news.urlToImage ?? 'https://jbdiamonds.com/media/catalog/new-pp/placeholder/default/no-img-1000.jpg'}",
              size: Size(350, 150),
            ),
            SizedBox(height: 10),
            Text(
              "${news.title}",
              maxLines: 2,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 10),
            Text(
              "${news.source.name}",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}

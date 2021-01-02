import 'package:flutter/material.dart';
//widgets
import './shimmerImage_widget.dart';
//pages
import '../pages/newsDetails/newsDetails_page.dart';

class NewsListItem extends StatelessWidget {
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
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).accentColor,
        ),
        child: Row(
          children: [
            ShimmerImage(
              url: "https://picsum.photos/200/200",
              size: Size(110, 80),
              borderRadius: 5,
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spenco footwear now sold under Waco shoes",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "2 min read",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // child: Padding(
      //   padding: const EdgeInsets.only(bottom: 8.0),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(5),
      //     child: ListTile(
      //       contentPadding:
      //           EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      //       tileColor: Theme.of(context).accentColor,
      //       leading: ConstrainedBox(
      //         constraints: BoxConstraints(
      //           minWidth: 100,
      //           minHeight: 100,
      //           maxWidth: 100,
      //           maxHeight: 100,
      //         ),
      //         // color: Colors.red,
      //         child: ShimmerImage(
      //           url: "https://picsum.photos/200/200",
      //           size: Size(100, 100),
      //           borderRadius: 5,
      //         ),
      //       ),
      //       title: Text(
      //         "Spenco footwear now sold under Waco shoes",
      //         overflow: TextOverflow.ellipsis,
      //         maxLines: 2,
      //         style: Theme.of(context).textTheme.headline2,
      //       ),
      //       subtitle: Padding(
      //         padding: const EdgeInsets.only(top: 5),
      //         child: Text(
      //           "2 min read",
      //           style: Theme.of(context).textTheme.subtitle2,
      //         ),
      //       ),
      //     ),
      // ),
      // ),
    );
  }
}

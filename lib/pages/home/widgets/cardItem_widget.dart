//Core
import 'package:flutter/material.dart';
//Widgets
import '../../../widgets/shimmerImage_widget.dart';

class CardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 240,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerImage(url: "https://picsum.photos/200", size: Size(350, 150)),
          SizedBox(height: 10),
          Text(
            "Eating a diet rich in fruit and vegetables daily lowers risk Eating a diet rich in fruit and vegetables daily lowers risk Eating a diet rich in fruit and vegetables daily lowers risk ",
            maxLines: 2,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 10),
          Text(
            "3 min read",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}

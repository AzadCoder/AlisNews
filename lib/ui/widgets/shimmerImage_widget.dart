import 'package:flutter/material.dart';
//packages
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({
    Key key,
    @required this.size,
    @required this.url,
    this.borderRadius,
  }) : super(key: key);
  final String url;
  final Size size;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      child: Stack(
        children: [
          Shimmer.fromColors(
            baseColor: Color(0xff9f9fad),
            highlightColor: Color(0xff63626c),
            child: Container(
              color: Color(0xff9f9fad),
              width: size.width,
              height: size.height,
            ),
          ),
          FadeInImage.assetNetwork(
            width: size.width,
            height: size.height,
            placeholder: "",
            image: url,
            fit: BoxFit.cover,
            imageErrorBuilder: (context, o, s) {
              return Image.network(
                "https://jbdiamonds.com/media/catalog/new-pp/placeholder/default/no-img-1000.jpg",
                fit: BoxFit.cover,
                width: size.width,
                height: size.height,
              );
            },
          )
        ],
      ),
    );
  }
}

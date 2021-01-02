import 'package:flutter/material.dart';

class ScreenSize {
  //width
  width(BuildContext context, double percentage) {
    percentage == null ? percentage = 100 : percentage = percentage;
    return (MediaQuery.of(context).size.width / 100) * percentage;
  }

  //height
  height(BuildContext context, double percentage) {
    percentage == null ? percentage = 100 : percentage = percentage;
    return (MediaQuery.of(context).size.height / 100) * percentage;
  }
}

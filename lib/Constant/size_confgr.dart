import 'package:flutter/widgets.dart';
class SizeConfig {
  BuildContext context;

  SizeConfig(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
}
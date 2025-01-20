import 'package:flutter/cupertino.dart';

extension PaddingToWidget on Widget {

  Widget setHorizontalPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: enableMediaQuery ? mediaQuery.size.width * value : value,
      ),
      child: this,
    );
  }

  Widget setVerticalPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: enableMediaQuery ? mediaQuery.size.width * value : value,
      ),
      child: this,
    );
  }

  Widget setOnlyPadding(BuildContext context, {
    required double top,
    required double down,
    required double right,
    required double left,
    bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: enableMediaQuery ? mediaQuery.size.height * top : top,
        bottom: enableMediaQuery ? mediaQuery.size.height * down : down,
        right: enableMediaQuery ? mediaQuery.size.width * right : right,
        left: enableMediaQuery ? mediaQuery.size.height * left : left,
      ),
      child: this,
    );
  }

}

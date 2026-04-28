import 'package:flutter/cupertino.dart';

extension AppContext on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;
}

//Todo: how to use     width:context.screenWidth * 0.8,
//Todo:               height:context.screenHeight * 0.06,

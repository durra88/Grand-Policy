import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// return screen size
  Size size() => MediaQuery.of(this).size;

  /// return screen width
  double width() => MediaQuery.of(this).size.width;

  /// return screen height
  double height() => MediaQuery.of(this).size.height;

  /// return screen devicePixelRatio
  double pixelRatio() => MediaQuery.of(this).devicePixelRatio;

  /// returns brightness
  Brightness platformBrightness() => MediaQuery.of(this).platformBrightness;

  /// Return the height of status bar
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Return the height of navigation bar
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  /// Returns Theme.of(context)
  ThemeData get theme => Theme.of(this);



 


  /// Request focus to given FocusNode
  void requestFocus(FocusNode focus) {
    FocusScope.of(this).requestFocus(focus);
  }
}

//   bool isPhone() => MediaQuery.of(this).size.width < tabletBreakpointGlobal;

//   bool isTablet() =>
//       MediaQuery.of(this).size.width < desktopBreakpointGlobal &&
//       MediaQuery.of(this).size.width >= tabletBreakpointGlobal;

//   bool isDesktop() => MediaQuery.of(this).size.width >= desktopBreakpointGlobal;
// }

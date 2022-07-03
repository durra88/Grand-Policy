import 'package:flutter/material.dart';

import '../../value/colors.dart';

// ignore: must_be_immutable
class ButtonDeductionWidget extends StatelessWidget {
  final VoidCallback callback;
  String title;
  Color bg, titlecolor;
  double btnwidth;
  bool shadow;
  ButtonDeductionWidget({
    Key? key,
    required this.callback,
    required this.title,
    required this.bg,
    required this.titlecolor,
    required this.btnwidth,
    required this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: btnwidth,
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: bg,
          child: InkWell(
            highlightColor: buttoncolor1.withOpacity(0.1),
            splashColor: buttoncolor1.withOpacity(0.5),
            onTap: callback,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              alignment: Alignment.center,
              height: 35.00,
              decoration: bg == null
                  ? BoxDecoration(
                      gradient: buttonGradient,
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : BoxDecoration(
                      color: bg,

                      // gradient: smartkeygradient,

                      boxShadow: [shadow == true ? boxShadow : transboxShadow],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: titlecolor),
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  // ignore: prefer_typing_uninitialized_variables
  final shapeBorder;
  // ignore: use_key_in_widget_constructors
  const ShimmerWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder();
  // ignore: use_key_in_widget_constructors
  const ShimmerWidget.circular(
      {required this.width,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: const Color(0xFFE0E0E0),
      baseColor: const Color(0xFFBDBDBD),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(color: Colors.grey, shape: shapeBorder),
      ),
    );
  }
}

class SimmerLoadingData extends StatelessWidget {
  const SimmerLoadingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ShimmerWidget.circular(
        height: 64,
        width: 64,
        shapeBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      title: const ShimmerWidget.rectangular(height: 16),
      subtitle: const ShimmerWidget.rectangular(height: 14),
    );
  }
}

class SimmerHeaderData extends StatelessWidget {
  const SimmerHeaderData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      ShimmerWidget.rectangular(height: 16),
      SizedBox(
        height: 10,
      ),
      ShimmerWidget.rectangular(
        height: 16,
      )
    ]);
  }
}

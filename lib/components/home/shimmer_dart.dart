import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool homeNotChat;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangle(
      {required this.width, required this.height, required this.homeNotChat})
      : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circle(
      {required this.height,
      required this.width,
      required this.homeNotChat,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Theme.of(context).dividerColor,
      highlightColor: Theme.of(context).primaryColorDark,
      child: homeNotChat
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              width: width,
              height: height,
            )
          : Container(
              decoration: ShapeDecoration(
                color: Colors.grey,
                shape: shapeBorder,
              ),
              width: width,
              height: height,
            ),
    );
  }
}

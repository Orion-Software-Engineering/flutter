import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool homeNotChat;

  const ShimmerWidget.rectangle(
      {this.width = double.infinity,
      required this.height,
      required this.homeNotChat});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ttb,
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
          : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                width: width,
                height: height,
              ),
            ),
    );
  }
}

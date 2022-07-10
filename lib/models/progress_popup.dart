// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class Progress extends StatelessWidget {

  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color> ?valueColor;

  Progress({
    Key ?key,
    required this.child,
    required this.inAsyncCall,
    this.opacity=0.3,
    this.color=Colors.grey,
    this.valueColor,
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList =<Widget>[];
    widgetList.add(child);
    if(inAsyncCall){
      final modal=new Stack(
        children: [
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: true,color: color),
          ),
          new Center(
            child: new CircularProgressIndicator(),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );

  }
}
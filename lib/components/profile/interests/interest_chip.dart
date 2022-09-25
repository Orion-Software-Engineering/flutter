import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InterestChip extends StatefulWidget {
  String text;
  bool selected;
  InterestChip({super.key, required this.text, required this.selected});

  @override
  State<InterestChip> createState() => _InterestChipState();
}

class _InterestChipState extends State<InterestChip> {
  @override
  Widget build(BuildContext context) {
    switch (widget.text) {
      case "science":
        widget.text = "Science & Technology";
        break;
      case "health":
        widget.text = "Health & Fitness";
        break;
      case "cars":
        widget.text = "Cars & Vehicles";
        break;
      case "hair":
        widget.text = "Hair & Beauty";
        break;
      case "news":
        widget.text = "News & Politics";
        break;
    }
    Color? textAndIconColor =
        Theme.of(context).primaryTextTheme.bodyText1?.color;
    List<List<Widget>> versions = [
      [
        Text(widget.text[0].toUpperCase() + widget.text.substring(1),
            style: TextStyle(color: textAndIconColor)),
      ],
      [
        Icon(Icons.check, color: textAndIconColor),
        Text(widget.text[0].toUpperCase() + widget.text.substring(1),
            style: TextStyle(color: textAndIconColor)),
      ]
    ];
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: (widget.selected) ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: (widget.selected) ? versions[1] : versions[0],
            ),
          ),
        ),
      ),
    );
  }
}

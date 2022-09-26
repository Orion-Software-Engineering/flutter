import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/constants.dart';

// ignore: must_be_immutable
class InterestChip extends StatefulWidget {
  String text;
  bool selected;
  void Function(String name) remove;
  void Function(String name) add;

  InterestChip({
    super.key,
    required this.text,
    required this.selected,
    required this.remove,
    required this.add,
  });

  @override
  State<InterestChip> createState() => _InterestChipState();
}

class _InterestChipState extends State<InterestChip> {
  String chipText = '';
  @override
  Widget build(BuildContext context) {
    chipText = interestMap[widget.text]!;
    Color? textAndIconColor =
        Theme.of(context).primaryTextTheme.bodyText1?.color;
    List<List<Widget>> versions = [
      [
        Text(chipText, style: TextStyle(color: textAndIconColor)),
      ],
      [
        Icon(Icons.check, color: textAndIconColor),
        Text(chipText, style: TextStyle(color: textAndIconColor)),
      ]
    ];
    return GestureDetector(
      onTap: () {
        if (widget.selected) {
          widget.remove(widget.text);
        } else {
          widget.add(widget.text);
        }
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

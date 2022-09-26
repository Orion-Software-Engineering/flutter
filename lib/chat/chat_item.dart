// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatItem extends StatelessWidget {
  final String? time;
  final bool messageIsFromMe;
  final String text;
  // ignore: use_key_in_widget_constructors
  const ChatItem(
      {required this.messageIsFromMe, required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    if (!messageIsFromMe) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        TextBubble(
          text: text,
          color: Color(0xFFE53935),
          time: time,
          isFromMe: messageIsFromMe,
        ),
      ]);
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        TextBubble(
            text: text,
            color: Colors.grey,
            time: time,
            isFromMe: messageIsFromMe),
      ]);
    }
  }
}

class TextBubble extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TextBubble(
      {Key? key,
      required this.text,
      required this.color,
      required this.time,
      required this.isFromMe});
  final String? time;
  final String text;
  final Color color;
  final bool isFromMe;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.8;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
      child: Container(
        constraints: BoxConstraints(minWidth: 110, maxWidth: 260),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(
                  text,
                  maxLines: 10,
                  // textWidthBasis: TextWidthBasis.,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      overflow: TextOverflow.clip),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    getCustomFormattedDateTime(time),
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Color(0xff2c2c2c), fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

getCustomFormattedDateTime(String? givenDateTime) {
  String time = '...';
  if (givenDateTime != null) {
    String? dateFormat = 'hh:mm a';
    DateTime now = DateTime.now();
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    DateTime messageDate =
        DateTime(docDateTime.year, docDateTime.month, docDateTime.day);
    var diff = now.difference(messageDate);

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = DateFormat(dateFormat).format(docDateTime);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} DAY AGO';
      } else {
        time = '${diff.inDays} DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} WEEK AGO';
      } else {
        time = '${(diff.inDays / 7).floor()} WEEKS AGO';
      }
    }
  }

  return time;
}

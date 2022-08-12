import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      height: 70,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.emoji_emotions),
            iconSize: 25,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message",
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send_rounded),
            iconSize: 25,
          )
        ],
      ),
    );
  }
}

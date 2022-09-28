// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_profile.dart';

class BioField extends StatefulWidget {
  ProfileApiService apiServiceProfile;
  String bioText = '';
  VoidCallback refresh;
  bool isEditable;
  String username;

  BioField(
      {super.key,
      required this.apiServiceProfile,
      required this.bioText,
      required this.refresh,
      required this.isEditable,
      required this.username});

  @override
  State<BioField> createState() => _BioFieldState();
}

class _BioFieldState extends State<BioField> {
  int index = 0;
  TextEditingController newBioText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<List<Widget>> bioFieldsVersions = [
      [
        Text(
          "Bio",
          style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).primaryTextTheme.bodyText2?.color,
              fontWeight: FontWeight.w400),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 10,
              child: Text(
                widget.bioText,
                maxLines: 3,
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryTextTheme.bodyText1?.color,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ],
      [
        Text(
          "Bio",
          style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).primaryTextTheme.bodyText2?.color,
              fontWeight: FontWeight.w400),
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 10,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1
                            ?.color),
                    controller: newBioText,
                    expands: true,
                    maxLines: null,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        disableScreen();
                        widget.apiServiceProfile
                            .updateBio(newBioText.text)
                            .then((value) {
                          newBioText.clear();
                          print(
                              "gogogo\ngogogo\ngogogo\ngogogo\ngogogo\ngogogo\ngogogo\n");
                          index = 0;
                          widget.refresh();
                          print(
                              "gigigii\ngigigii\ngigigii\ngigigii\ngigigii\ngigigii\ngigigii\ngigigii");
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4)),
                          child: Icon(
                            Icons.check,
                            // size: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4)),
                        child: Icon(
                          Icons.close,
                          // size: 1,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2
                              ?.color,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFFFE000), borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [Text(widget.username)],
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (widget.isEditable)
                  ? bioFieldsVersions[index]
                  : [
                      Text(
                        "Bio",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        widget.bioText,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                ?.color,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
            ),
          ],
        ),
      ),
    );
  }

  disableScreen() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Container();
        });
  }
}

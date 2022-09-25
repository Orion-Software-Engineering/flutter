import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/profile/interests/interest_chip.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'active_interests_list.dart';

class EditInterestModel {
  String name;
  bool selected;
  EditInterestModel({required this.name, required this.selected});
}

// ignore: must_be_immutable
class InterestField extends StatefulWidget {
  List<String> allInterests = [
    'art',
    "business",
    'cars',
    "comedy",
    "education",
    "entertainment",
    "food",
    "fashion",
    "gaming",
    "health",
    "hair",
    "news",
    "photography",
    "science",
    "sports"
  ];
  List<String> localInterestList = [];
  bool? isEditable;
  InterestField(
      {super.key, required this.localInterestList, required this.isEditable});

  @override
  State<InterestField> createState() => _InterestFieldState();
}

class _InterestFieldState extends State<InterestField> {
  @override
  Widget build(BuildContext context) {
    List<EditInterestModel> editInterestList = [];
    print("localInterestList ${widget.localInterestList}");
    for (String i in widget.allInterests) {
      if (widget.localInterestList.contains(i)) {
        print("true $i");
        editInterestList.add(EditInterestModel(name: i, selected: true));
      } else {
        print("false $i");
        editInterestList.add(EditInterestModel(name: i, selected: false));
      }
    }

    List<List<Widget>> versions = [
      [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Active Interests',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              ActiveInterestsList(interestList: widget.localInterestList ?? []),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        print(
                            "edit interest list length${editInterestList.length}");
                        return Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Theme.of(context).primaryColor,
                              height: MediaQuery.of(context).size.height * 0.38,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Edit Interests",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1
                                            ?.color,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Wrap(
                                    spacing: 10,
                                    children: [
                                      for (EditInterestModel i
                                          in editInterestList)
                                        InterestChip(
                                            text: i.name, selected: i.selected)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Icon(Icons.edit, color: Colors.grey)))
      ],
      [
        Expanded(
          flex: 14,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Active Interests',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              ActiveInterestsList(interestList: widget.localInterestList ?? []),
            ],
          ),
        )
      ]
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Row(
        children: (widget.isEditable!) ? versions[0] : versions[1],
      ),
    );
  }
}

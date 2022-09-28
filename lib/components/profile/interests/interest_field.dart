import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/profile/interests/interest_chip.dart';
import '../../../api/api_service_profile.dart';
import 'active_interests_list.dart';

// ignore: must_be_immutable
class InterestField extends StatefulWidget {
  ProfileApiService profileApiService;
  VoidCallback refresh;
  List<String> localInterestList = [];
  bool? isEditable;
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
    "beauty",
    "news",
    "photography",
    "science",
    "sports"
  ];
  InterestField(
      {super.key,
      required this.localInterestList,
      required this.isEditable,
      required this.profileApiService,
      required this.refresh});

  @override
  State<InterestField> createState() => _InterestFieldState();
}

class _InterestFieldState extends State<InterestField> {
  List<String> interestListToAdd = [];
  List<String> interestListToRemoveFromOriginal = [];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Active Interests',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              print(
                                  "edit interest list length${editInterestList.length}");
                              return Dialog(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    height: 400,
                                    width: 400,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                text: i.name,
                                                selected: i.selected,
                                                add: (String interest) {
                                                  if (widget.localInterestList
                                                      .contains(interest)) {
                                                    interestListToRemoveFromOriginal
                                                        .remove(interest);
                                                  } else {
                                                    interestListToAdd
                                                        .add(interest);
                                                  }
                                                  print(
                                                      "original $interestListToRemoveFromOriginal");
                                                  print(
                                                      "new $interestListToAdd");
                                                },
                                                remove: (String interest) {
                                                  if (widget.localInterestList
                                                      .contains(interest)) {
                                                    interestListToRemoveFromOriginal
                                                        .add(interest);
                                                  } else {
                                                    interestListToAdd
                                                        .remove(interest);
                                                    print("here");
                                                  }
                                                  print(
                                                      "original $interestListToRemoveFromOriginal");
                                                  print(
                                                      "new $interestListToAdd");
                                                },
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).then((value) {
                          print("to add $interestListToAdd");
                          if (interestListToAdd.isNotEmpty) {
                            widget.profileApiService
                                .addInterests(interestListToAdd)
                                .then((value) {
                              if (interestListToRemoveFromOriginal.isNotEmpty) {
                                print(
                                    "to remove $interestListToRemoveFromOriginal");
                                widget.profileApiService.deleteInterests(
                                    interestListToRemoveFromOriginal);
                              }
                            }).then((value) => widget.refresh());
                          } else if (interestListToRemoveFromOriginal
                              .isNotEmpty) {
                            print(
                                "to remove $interestListToRemoveFromOriginal");
                            widget.profileApiService
                                .deleteInterests(
                                    interestListToRemoveFromOriginal)
                                .then((value) => widget.refresh());
                          }
                        });
                      },
                      child: Icon(Icons.edit, color: Colors.grey))
                ],
              ),
              ActiveInterestsList(interestList: widget.localInterestList),
            ],
          ),
        ),
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
              ActiveInterestsList(interestList: widget.localInterestList),
            ],
          ),
        )
      ]
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: (widget.isEditable!) ? versions[0] : versions[1],
      ),
    );
  }
}

class EditInterestModel {
  String name;
  bool selected;
  EditInterestModel({required this.name, required this.selected});
}

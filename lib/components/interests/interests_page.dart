/*
* This widget is used in all three interests pages
* this page holds 5 interests buttons
* these buttons are populated by a list on interests in constants.dart and are selected in fives.
* the value of PageNumber determines which 5 items would be selected.
* pageNumber = 1 means index 0 is the starting point and the index would be incremented 4 times to get all 5 interests.
* this index = interestListStartIndex in this file
* the text held by these 5 butt*/

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matchmaking_demo/api/login_signup_interests/api_service_interests.dart';
import 'package:matchmaking_demo/models/progress_popup.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:matchmaking_demo/utils/variables.dart';
import '../../models/login_signup_interests/interest_model.dart';
import 'interests_button.dart';

class InterestsPage extends StatefulWidget {
  InterestsPage(
      {Key? key,
      required this.pageNumber,
      this.nextPage,
      required this.showBackButton})
      : super(key: key);
  //pageNumber is used to determine whether the page requires a back button or not. Since page one does not require one.
  //it is also used to choose between 'Next-->'and 'Done' for moving to the next page
  //pageNumber is also used to tell
  int pageNumber;
  String? nextPage;
  bool showBackButton = true;

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  int? interestListStartIndex;
  String helpText = '';
  late InterestRequestModel requestModel;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    requestModel = InterestRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Progress(
      isLoading: isLoading,
      opacity: 0,
      child: _ui(context),
    );
  }

  Widget _ui(BuildContext context) {
    if (widget.pageNumber == 1) {
      interestListStartIndex = 0;
    } else if (widget.pageNumber == 2) {
      interestListStartIndex = 5;
    } else if (widget.pageNumber == 3) {
      interestListStartIndex = 10;
    }

    return Column(
      children: [
        Text(
          "Let's know your interests!",
          style: TextStyle(
              fontSize: 40,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryTextTheme.bodyText1?.color),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            '${widget.pageNumber}/3',
            style: interestsPageNumberStyle,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: InterestsButton(
                  text: interestsList[interestListStartIndex!],
                ),
              ),
              Expanded(
                child: InterestsButton(
                  text: interestsList[interestListStartIndex! + 1],
                ),
              ),
              Expanded(
                child: InterestsButton(
                  text: interestsList[interestListStartIndex! + 2],
                ),
              ),
              Expanded(
                child: InterestsButton(
                  text: interestsList[interestListStartIndex! + 3],
                ),
              ),
              Expanded(
                child: InterestsButton(
                  text: interestsList[interestListStartIndex! + 4],
                ),
              )
            ],
          ),
        ),
        Text(
          ((3 - globalInterestsSet.length) > 0)
              ? "Select at least 3 interests"
              : "",
          style: interestsPageNextBackStyle,
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  globalInterestsSet.removeAll([
                    interestsList[interestListStartIndex!],
                    interestsList[interestListStartIndex! + 1],
                    interestsList[interestListStartIndex! + 2],
                    interestsList[interestListStartIndex! + 3],
                    interestsList[interestListStartIndex! + 4]
                  ]);
                  Navigator.pop(context);
                },
                child: (!widget.showBackButton)
                    ? SizedBox(width: 10)
                    : Text(
                        '<--Back',
                        style: interestsPageNextBackStyle,
                        textAlign: TextAlign.right,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.pageNumber == 3) {
                    if (globalInterestsSet.length < 3) {
                      Fluttertoast.showToast(
                          backgroundColor: Color(0x9E9E9E7E),
                          textColor: Colors.white,
                          msg: 'Select at least 3 interests',
                          fontSize: 16);
                    } else {
                      pushInterestListAndRoute();
                    }
                  } else {
                    switch (widget.pageNumber) {
                      case 1:
                        Navigator.of(context).goToInterests2();
                        break;
                      case 2:
                        Navigator.of(context).goToInterests3();
                        break;
                    }
                  }
                },
                child: Text(
                  (widget.pageNumber == 3) ? 'Done' : 'Next-->',
                  style: interestsPageNextBackStyle,
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 210, 0, 0),
          child: TextButton(
              onPressed: () {
                if (globalInterestsSet.length > 2) {
                  isLoading = true;
                  requestModel.interests = globalInterestsSet.toList();
                  InterestAPIService apiService = InterestAPIService();
                  apiService.interest(requestModel).then((value) {
                    setState(() {
                      isLoading = false;
                      Navigator.of(context).goToAllSet();
                    });
                  });
                } else {
                  Fluttertoast.showToast(
                      backgroundColor: Color(0x9E9E9E7E),
                      textColor: Colors.white,
                      msg: 'Select at least 3 interests',
                      fontSize: 16);
                }
              },
              child: TextButton(
                onPressed: () {
                  print("Skipped");
                  print(globalInterestsSet.length);
                  if (globalInterestsSet.length > 2) {
                    print("here");
                    pushInterestListAndRoute();
                  }
                },
                child: Text(
                  'Skip now -->',
                  style: interestsPageNextBackStyle,
                ),
              )),
        )
      ],
    );
  }

  void pushInterestListAndRoute() {
    setState(() {
      isLoading = true;
    });
    requestModel.interests = globalInterestsSet.toList();
    print(globalInterestsSet.toList());
    print(globalInterestsSet.toList().runtimeType);
    InterestAPIService apiService = InterestAPIService();
    apiService.interest(requestModel).then((value) {
      setState(() {
        isLoading = false;
        Navigator.of(context).goToAllSet();
      });
    });
  }
}

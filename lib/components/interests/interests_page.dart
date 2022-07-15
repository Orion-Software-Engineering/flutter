// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matchmaking_demo/models/interest_model.dart';
import 'package:matchmaking_demo/models/progress_popup.dart';
import 'package:matchmaking_demo/utils/variables.dart';
import '../../utils/constants.dart';
import 'interests_button.dart';
import 'package:matchmaking_demo/api/api_service_interests.dart';


class InterestsPage extends StatefulWidget {
  InterestsPage(
      {Key? key,
      required this.pageNumber,
      this.nextPage,
      required this.showBackButton})
      : super(key: key);
  int pageNumber;
  String? nextPage;
  bool showBackButton = true;

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  int? interestListLocalStartIndex;
  String helpText = '';
  late InterestRequestModel requestModel;
  late InterestResponseModel responseModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = InterestRequestModel();
    responseModel = InterestResponseModel();
  }

  @override
  Widget build(BuildContext context) {
    return Progress(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: _ui(context),
    );
  }

  Widget _ui(BuildContext context) {
    if (widget.pageNumber == 1) {
      interestListLocalStartIndex = 0;
    } else if (widget.pageNumber == 2) {
      interestListLocalStartIndex = 5;
    } else if (widget.pageNumber == 3) {
      interestListLocalStartIndex = 10;
    }

    return Column(
      children: [
        Text(
          "Let's know your interests!",
          style: interestsTitleStyle,
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
                  text: interestsList[interestListLocalStartIndex!],
                ),
              ),
              Expanded(
                child: InterestsButton(
                  text: interestsList[interestListLocalStartIndex! + 1],
                ),
              ),
              Expanded(
                child: InterestsButton(
                  text: interestsList[interestListLocalStartIndex! + 2],
                ),
              ),
              Expanded(
                child: InterestsButton(
                  text: interestsList[interestListLocalStartIndex! + 3],
                ),
              ),
              Expanded(
                child: InterestsButton(
                  text: interestsList[interestListLocalStartIndex! + 4],
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
                    interestsList[interestListLocalStartIndex!],
                    interestsList[interestListLocalStartIndex! + 1],
                    interestsList[interestListLocalStartIndex! + 2],
                    interestsList[interestListLocalStartIndex! + 3],
                    interestsList[interestListLocalStartIndex! + 4]
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
                      setState((){
                        isApiCallProcess = true;
                        print(globalInterestsSet.toList());
                      });
                      requestModel.interests=globalInterestsSet.toList();
                      InterestAPIService apiService = InterestAPIService();
                      apiService.interest(requestModel).then((value) {
                        setState(() {
                          isApiCallProcess = false;
                        });
                        Navigator.pushNamed(context, '/all_set');
                      });
                    }
                  } else {
                    Navigator.pushNamed(context, widget.nextPage!);
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
                print(globalInterestsSet);
                if (globalInterestsSet.length > 2) {
                  Navigator.pushNamed(context, '/all_set');
                } else {
                  Fluttertoast.showToast(
                      backgroundColor: Color(0x9E9E9E7E),
                      textColor: Colors.white,
                      msg: 'Select at least 3 interests',
                      fontSize: 16);
                }
              },
              child: Text(
                'Skip now -->',
                style: interestsPageNextBackStyle,
              )),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/varriables.dart';
import '../../utils/constants.dart';
import 'interests_button.dart';

class InterestsPage extends StatelessWidget {
  InterestsPage(
      {required this.pageNumber, this.nextPage, required this.showBackButton});
  int pageNumber;
  int? interestListLocalStartIndex;
  String? nextPage;
  String helpText = '';
  bool showBackButton = true;

  @override
  Widget build(BuildContext context) {
    if (pageNumber == 1) {
      interestListLocalStartIndex = 0;
    } else if (pageNumber == 2) {
      interestListLocalStartIndex = 5;
    } else if (pageNumber == 3) {
      interestListLocalStartIndex = 10;
    }

    return Container(
      child: Column(
        children: [
          Text(
            "Let's know your interests!",
            style: interestsTitleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              '${pageNumber}/3',
              style: interestsPageNumberStyle,
              textAlign: TextAlign.right,
            ),
          ),
          Expanded(
            child: Container(
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
          ),
          Text(
            ((3 - globalInterestsSet.length) > 0)
                ? "Select at least 3 interests"
                : "",
            style: interestsPageNextBackStyle,
          ),
          Container(
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
                  child: (!showBackButton)
                      ? SizedBox(width: 10)
                      : Text(
                          '<--Back',
                          style: interestsPageNextBackStyle,
                          textAlign: TextAlign.right,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    if (pageNumber == 3) {
                      //TODO API Call should be done here with globalInterestsSet. Convert to list if needed.
                    }
                    Navigator.pushNamed(context, nextPage!);
                  },
                  child: Text(
                    (pageNumber == 3) ? 'Done' : 'Next-->',
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
                },
                child: Text(
                  'Skip now -->',
                  style: interestsPageNextBackStyle,
                )),
          )
        ],
      ),
    );
  }
}

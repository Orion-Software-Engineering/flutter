import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/home/home_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      // decoration: BoxDecoration(color: Colors.grey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/home/SarahImage.png',
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        width: double.infinity,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color(0x20BDBDBD),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Sarah',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 1,
                                )
                              ],
                            ),
                            Text(
                              'Some bullshit as usual, no one is really honest on social media',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

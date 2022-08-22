import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_profile.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/profile/active_interests_list.dart';
import '../components/profile/bio_fields.dart';
import '../components/profile/interests_bullet.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? username = "NA";
  String? email = "NA";
  String? dateOfBirth = "NA";
  bool? gender;

  @override
  // ignore: must_call_super
  void initState() {
    APIServiceProfile apiServiceProfile = APIServiceProfile();
    apiServiceProfile.getProfile();
    getProfilePageData();
    print(
        "PPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\nPPPPPPPPPPPPPP\n");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: const <Color>[
                        Color(0xFFFF0000),
                        Color(0xFF0000FF)
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Image.asset(
                              'assets/images/messaging/Avatars/Aquarius.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFF00FF00),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'verified',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: Container())
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.46,
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BioFields(title: 'Username', value: username),
                  BioFields(title: 'Email', value: email),
                  BioFields(title: 'Date of Birth', value: dateOfBirth),
                  BioFields(title: 'Gender', value: (gender!) ? "M" : "F"),
                  BioFields(title: 'Bio', value: "Lorem Ipsum"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Active Interests',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                        ActiveInterestsList(interestList: interestsList),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40, 0, 0),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  void getProfilePageData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    print("in getProfileData");
    setState(() {
      email = sharedPreferences.getString("email");
      // sharedPreferences.getBool("isEmailVerified");
      username = sharedPreferences.getString("username");
      dateOfBirth = sharedPreferences.getString("dateOfBirth");
      gender = sharedPreferences.getBool("gender");
    });
    print("dob: $dateOfBirth");
  }
}

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_profile.dart';
import 'package:matchmaking_demo/components/login_signup/custom_back_button.dart';
import 'package:matchmaking_demo/models/profile/profile_model.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import '../components/profile/active_interests_list.dart';
import '../components/profile/bio_fields.dart';

class Profile extends StatefulWidget {
  final String userId;
  const Profile({required this.userId});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileResponseModel profileResponse = ProfileResponseModel();
  APIServiceProfile apiServiceProfile = APIServiceProfile();

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    apiServiceProfile
        .getProfile(widget.userId)
        .then((value) => getProfileData());

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
                flex: 2,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(color: Color(0x00338742)),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Center(
                              child: Text(
                            "K",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Nunito"),
                          )),
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
              Expanded(flex: 3, child: Container())
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
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
                  TextField(),
                  BioFields(
                      title: 'Username',
                      value: profileResponse.username,
                      isGender: false),
                  BioFields(
                      title: 'Email',
                      value: profileResponse.email,
                      isGender: false),
                  BioFields(
                      title: 'Date of Birth',
                      value: profileResponse.dateOfBirth,
                      isGender: false),
                  BioFields(
                    title: 'Gender',
                    isGender: true,
                    genderValue: profileResponse.gender,
                  ),
                  BioFields(
                      title: 'Bio', value: "Lorem Ipsum", isGender: false),
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
            child: CustomBackButton(),
          ),
        ],
      ),
    );
  }

  void getProfileData() async {
    setState(() {
      profileResponse = apiServiceProfile.profileResponseModel;
    });
  }
  // void getProfilePageData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   print("in getProfileData");
  //   setState(() {
  //     email = sharedPreferences.getString("email");
  //     // sharedPreferences.getBool("isEmailVerified");
  //     username = sharedPreferences.getString("username");
  //     dateOfBirth = sharedPreferences.getString("dateOfBirth");
  //     gender = sharedPreferences.getBool("gender");
  //   });
  //   print("dob: $dateOfBirth");
  // }
}

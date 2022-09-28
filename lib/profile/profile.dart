import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_profile.dart';
import 'package:matchmaking_demo/components/login_signup/custom_back_button.dart';
import 'package:matchmaking_demo/models/profile/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/profile/bio_field.dart';
import '../components/profile/interests/interest_field.dart';
import '../components/profile/profile_fields.dart';

class Profile extends StatefulWidget {
  final String userId;
  const Profile({super.key, required this.userId});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Color> bioCardColours = [
    Color(0xfffbdf00),
    Color(0xffc60000),
    Color(0xff007aff)
  ];
  Color? bioCardColor;
  String? myUserId;
  ProfileResponseModel profileResponse = ProfileResponseModel();
  ProfileApiService apiServiceProfile = ProfileApiService();
  double? paddingTop = 0.17;
  bool? canEditBio;
  @override
  void initState() {
    super.initState();
    bioCardColor = bioCardColours[Random().nextInt(3)];
    checkIfEditable().then((value) {
      if (!canEditBio!) {
        getProfileCall();
      }
    });
  }

  Future<void> checkIfEditable() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    myUserId = sharedPreferences.getString("userId");
    if (myUserId == widget.userId) {
      setState(() {
        canEditBio = true;

        profileResponse.interests =
            sharedPreferences.getStringList("interests");
        profileResponse.gender = sharedPreferences.getBool("gender");
        profileResponse.dateOfBirth = sharedPreferences.getString("dob");
        profileResponse.email = sharedPreferences.getString("email");
        profileResponse.bio = sharedPreferences.getString("bio");

        profileResponse.username = sharedPreferences.getString("username");
      });
    } else {
      setState(() {
        canEditBio = false;
      });
    }
  }

  void getProfileCall() {
    apiServiceProfile
        .getProfile(widget.userId)
        .then((value) => getProfileData());
  }

  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  @override
  Widget build(BuildContext context) {
    if (canEditBio ?? false) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "assets/images/matching/doodle.png",
                  height: MediaQuery.of(context).size.height,
                  repeat: ImageRepeat.repeatY,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.18,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xd04f4f4f),
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: Offset(0, 1), // shadow direction: bottom right
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xd0a2a2a2),
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                      offset: Offset(0,
                                          1), // shadow direction: bottom right
                                    ),
                                  ],
                                  color: bioCardColor,
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profile/bio_card_background.png"),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            profileResponse.username!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: "Nunito",
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            profileResponse.email!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    BioField(
                                      apiServiceProfile: apiServiceProfile,
                                      bioText: (profileResponse.bio == null)
                                          ? ""
                                          : profileResponse.bio!,
                                      refresh: () {
                                        getProfileCall();
                                        Navigator.pop(context);
                                      },
                                      isEditable: canEditBio ?? false,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.004,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Divider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 10,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ProfileFields(
                                      title: "Date of Birth",
                                      value: profileResponse.dateOfBirth,
                                      isGender: false),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: ProfileFields(
                                      title: "Gender",
                                      isGender: true,
                                      genderValue: profileResponse.gender,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              InterestField(
                                localInterestList:
                                    profileResponse.interests ?? [],
                                isEditable: canEditBio ?? false,
                                profileApiService: apiServiceProfile,
                                refresh: () {
                                  getProfileCall();
                                },
                              ),
                              // Divider(
                              //   color: Colors.black,
                              //   indent: 10,
                              //   endIndent: 10,
                              // ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                left: MediaQuery.of(context).size.width * 0.373,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.11,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xb88f8f8f),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 2), // shadow direction: bottom right
                      )
                    ],
                    color: Color(0xFFFF5A00),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      profileResponse.username![0] ?? "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Nunito"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: CustomBackButton(
                    backColor:
                        Theme.of(context).primaryTextTheme.bodyText1?.color),
              ),
            ],
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "assets/images/matching/doodle.png",
                  height: MediaQuery.of(context).size.height,
                  repeat: ImageRepeat.repeatY,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.18,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xd04f4f4f),
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: Offset(0, 1), // shadow direction: bottom right
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xd0a2a2a2),
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                      offset: Offset(0,
                                          1), // shadow direction: bottom right
                                    ),
                                  ],
                                  color: bioCardColor, //todo colour
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profile/bio_card_background.png"),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            profileResponse.username ?? "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: "Nunito",
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    BioField(
                                      apiServiceProfile: apiServiceProfile,
                                      bioText: (profileResponse.bio == null)
                                          ? ""
                                          : profileResponse.bio!,
                                      refresh: () {
                                        getProfileCall();
                                        Navigator.pop(context);
                                      },
                                      isEditable: canEditBio ?? false,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.004,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Divider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 10,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ProfileFields(
                                      title: "Date of Birth",
                                      value: profileResponse.dateOfBirth,
                                      isGender: false),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: ProfileFields(
                                      title: "Gender",
                                      isGender: true,
                                      genderValue: profileResponse.gender,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),

                              InterestField(
                                localInterestList:
                                    profileResponse.interests ?? [],
                                isEditable: canEditBio ?? false,
                                profileApiService: apiServiceProfile,
                                refresh: () {
                                  getProfileCall();
                                },
                              ),
                              // Divider(
                              //   color: Colors.black,
                              //   indent: 10,
                              //   endIndent: 10,
                              // ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                left: MediaQuery.of(context).size.width * 0.373,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.11,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xb88f8f8f),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 2), // shadow direction: bottom right
                      )
                    ],
                    color: Color(0xFFFF5A00),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      (profileResponse.username == null)
                          ? ""
                          : profileResponse.username![0],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Nunito"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: CustomBackButton(
                    backColor:
                        Theme.of(context).primaryTextTheme.bodyText1?.color),
              ),
            ],
          ),
        ),
      );
    }
  }

  void getProfileData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      profileResponse = apiServiceProfile.profileResponseModel;
    });
    sharedPreferences.setStringList("interests", profileResponse.interests!);
    sharedPreferences.setString("bio", profileResponse.bio!);
  }
}

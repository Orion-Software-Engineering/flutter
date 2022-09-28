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
  String? myUserId;
  ProfileResponseModel profileResponse = ProfileResponseModel();
  ProfileApiService apiServiceProfile = ProfileApiService();
  double? paddingTop = 0.17;
  bool? canEditBio;
  @override
  void initState() {
    super.initState();
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
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Container()],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                left: MediaQuery.of(context).size.width * 0.36,
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
                      profileResponse.username![0],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Nunito"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Container();
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

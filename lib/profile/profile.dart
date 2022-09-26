import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_profile.dart';
import 'package:matchmaking_demo/components/login_signup/custom_back_button.dart';
import 'package:matchmaking_demo/models/profile/profile_model.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/profile/interests/active_interests_list.dart';
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
  double? paddingTop;
  bool? canEditBio;

  @override
  void initState() {
    super.initState();
    getProfileCall();
    checkIfEditable();
  }

  void checkIfEditable() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    myUserId = sharedPreferences.getString("userId");
    if (myUserId == widget.userId) {
      canEditBio = true;
    } else {
      canEditBio = false;
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
    if (_keyboardIsVisible()) {
      paddingTop = 0.2;
    } else {
      paddingTop = 0.35;
    }
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(color: Color(0x00338742)),
                      Container(
                        height: (!_keyboardIsVisible()) ? 100 : 60,
                        width: (!_keyboardIsVisible()) ? 100 : 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Center(
                            child: Text(
                          (profileResponse.username != null)
                              ? profileResponse.username![0]
                              : "",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Nunito"),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: (!_keyboardIsVisible()) ? 100 : 80,
                          height: (!_keyboardIsVisible()) ? 30 : 20,
                          decoration: BoxDecoration(
                            color: Color(0xFF00FF00),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'verified',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (!_keyboardIsVisible()) ? 16 : 11,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(flex: 3, child: Container())
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * paddingTop!,
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BioField(
                          isEditable: canEditBio ?? false,
                          bioText: (profileResponse.bio == null)
                              ? ""
                              : profileResponse.bio!,
                          apiServiceProfile: apiServiceProfile,
                          refresh: () {
                            getProfileCall();
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: ProfileFields(
                              title: 'Username',
                              value: profileResponse.username,
                              isGender: false),
                        ),
                        Expanded(
                          child: ProfileFields(
                              title: 'Email',
                              value: profileResponse.email,
                              isGender: false),
                        ),
                        Expanded(
                          child: ProfileFields(
                              title: 'Date of Birth',
                              value: profileResponse.dateOfBirth,
                              isGender: false),
                        ),
                        Expanded(
                          child: ProfileFields(
                            title: 'Gender',
                            isGender: true,
                            genderValue: profileResponse.gender,
                          ),
                        ),
                        InterestField(
                          localInterestList: profileResponse.interests ?? [],
                          isEditable: canEditBio ?? false,
                          profileApiService: apiServiceProfile,
                          refresh: () {
                            getProfileCall();
                          },
                        ),
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
}

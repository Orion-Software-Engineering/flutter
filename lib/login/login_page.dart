// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_login.dart';
import 'package:matchmaking_demo/models/login_model.dart';
import 'package:matchmaking_demo/models/progress_popup.dart';
import '../utils/constants.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey=GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp userNameValid = RegExp(r"^[a-zA-Z0-9_]*$");
  RegExp passwordValid = RegExp(r".+");
  //late String email='';
  //late String password='';
  bool isApiCallProcess=false;
  late LoginRequestModel requestModel;

  @override
  void initState(){
    super.initState();
    requestModel= new LoginRequestModel();
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
    //LoginRequestModel requestModel=new LoginRequestModel(email: email,password: password);
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sign_in/Sign Up bg.png'),
              fit: BoxFit.fill),
        ),
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 0.0, 20.0, 0.0),
        width: double.infinity,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Enter your username and password',
                        style: TextStyle(
                          color: signUpLoginTextColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: signUpLoginTextFieldTextStyle,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: signUpLoginTextColor,
                              ),
                            ),
                          ),
                          onSaved: (value)=>requestModel.username=value!,
                          validator: (value) {
                            if (userNameValid.hasMatch(value!) &&
                                value.isNotEmpty) {
                                String username=value;
                                setState((){
                                  requestModel.username=username;
                                });
                              return null;
                            } else {
                              return "Enter a valid username address";
                            }
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            suffix: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      color: signUpLoginOrange, fontSize: 16),
                                )),
                            labelText: 'Password',
                            labelStyle: signUpLoginTextFieldTextStyle,
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                          ),
                          //onSaved: (value)=>requestModel.password=value!,
                          validator: (value) {
                            if (passwordValid.hasMatch(value!) && value.isNotEmpty) {
                              String password=value;
                              setState((){
                                requestModel.password=password;
                              });
                              //password=value;
                              return null;
                            } else {
                              return "Enter a valid password";
                            }
                          },
                        ),
                        SizedBox(height: 30.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              // padding: EdgeInsets.fromLTRB(190.0, 10.0, 190.0, 10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                          onPressed: () {
                            if(validateAndSave()){
                              setState((){
                                isApiCallProcess=true;
                              });
                              APIService apiService= new APIService();
                              apiService.login(requestModel).then((value){
                                setState((){
                                  isApiCallProcess=false;
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful')));
                              });
                              });
                              print(requestModel.toJson());
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 0.0),
                            child: Center(
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/sign_up');
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color(0xFFcd5d27),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                          child: Row(children: <Widget>[
                            Expanded(
                                child: Divider(
                              color: Colors.black,
                            )),
                            Text("    Sign In With    "),
                            Expanded(
                                child: Divider(
                              color: Colors.black,
                            )),
                          ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Image(
                                image: AssetImage(
                                  'assets/images/sign_in/logo_apple.png',
                                ),
                                height: 44,
                                width: 45,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Image.asset(
                                    'assets/images/sign_in/logo_outlook.png',
                                    height: 44,
                                    width: 45)),
                            TextButton(
                                onPressed: () {},
                                child: Image.asset(
                                    'assets/images/sign_in/logo_google.png',
                                    height: 44,
                                    width: 45))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave(){
    final form=_formKey.currentState;
    if(form!.validate()){
      form.save;
      return true;
    }
    else{
      return false;
    }
  }
}




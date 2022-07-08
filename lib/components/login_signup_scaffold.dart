import 'package:flutter/material.dart';

class LogInSignUpScaffold extends StatelessWidget {
  LogInSignUpScaffold({required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage('assets/images/sign_in/Sign Up bg.png'),
              fit: BoxFit.cover),
        ),
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 0.0, 20.0, 0),
        width: double.infinity,
        child: child,
      ),
    );
  }
}

// Center(
// child: Form(
// key: _formKey,
// child: Column(
// children: [
// Expanded(
// flex: 2,
// child: TitleAndSubtext(
// title: 'Sign In',
// subtext: 'Enter your email and password',
// )),
// Expanded(
// flex: 3,
// child: SingleChildScrollView(
// physics: BouncingScrollPhysics(),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// TextFormField(
// decoration: InputDecoration(
// labelText: 'Email',
// labelStyle: signUpLoginTextFieldTextStyle,
// border: UnderlineInputBorder(
// borderSide: BorderSide(
// color: signUpLoginTextColor,
// ),
// ),
// ),
// validator: (value) {
// if (emailValid.hasMatch(value!) &&
// value.isNotEmpty) {
// return null;
// } else {
// return "Enter a valid email address";
// }
// },
// ),
// CustomPasswordField(
// hintText: 'Password',
// validationFunction: (value) {
// if (value!.isNotEmpty) {
// return null;
// } else {
// return 'Enter password';
// }
// }),
// TextButton(
// onPressed: () {},
// child: Text(
// 'Forgot password?',
// style: TextStyle(
// color: signUpLoginOrange, fontSize: 16),
// )),
// SizedBox(height: 30.0),
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: Colors.black,
// // padding: EdgeInsets.fromLTRB(190.0, 10.0, 190.0, 10.0),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(50.0),
// )),
// onPressed: () {
// if (!_formKey.currentState!.validate()) {
// return;
// }
// },
// child: Container(
// width: double.infinity,
// padding: EdgeInsets.symmetric(
// vertical: 8.0, horizontal: 0.0),
// child: Center(
// child: Text(
// 'LOG IN',
// style: TextStyle(
// fontSize: 22.0,
// fontWeight: FontWeight.w400,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
// SizedBox(height: 15.0),
// Padding(
// padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "Don't have an account?",
// style: TextStyle(
// fontSize: 15.0,
// ),
// ),
// MaterialButton(
// onPressed: () {
// Navigator.pushNamed(context, '/sign_up');
// },
// child: Text(
// 'Sign Up',
// style: TextStyle(
// color: Color(0xFFcd5d27),
// fontWeight: FontWeight.w700,
// fontSize: 16.0,
// decoration: TextDecoration.underline,
// ),
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
// child: Row(children: <Widget>[
// Expanded(
// child: Divider(
// color: Colors.black,
// )),
// Text("    Sign In With    "),
// Expanded(
// child: Divider(
// color: Colors.black,
// )),
// ]),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// TextButton(
// onPressed: () {},
// child: const Image(
// image: AssetImage(
// 'assets/images/sign_in/logo_apple.png',
// ),
// height: 44,
// width: 45,
// ),
// ),
// TextButton(
// onPressed: () {},
// child: Image.asset(
// 'assets/images/sign_in/logo_outlook.png',
// height: 44,
// width: 45)),
// TextButton(
// onPressed: () {},
// child: Image.asset(
// 'assets/images/sign_in/logo_google.png',
// height: 44,
// width: 45))
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ),

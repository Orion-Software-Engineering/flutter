import 'package:flutter/material.dart';
import 'package:matchmaking_demo/chat/chat_page.dart';
import 'package:matchmaking_demo/components/home/home_scaffold.dart';
import 'package:matchmaking_demo/delete/delete_page.dart';
import 'package:matchmaking_demo/interests/interests_1.dart';
import 'package:matchmaking_demo/interests/interests_2.dart';
import 'package:matchmaking_demo/interests/interests_3.dart';
import 'package:matchmaking_demo/models/messaging/conversation_model.dart';
import 'package:matchmaking_demo/signup/sign_up_page.dart';
import 'package:matchmaking_demo/splash/splash_screen.dart';
import '../components/interests/all_set.dart';
import '../forgotPassword/forgot_password_page.dart';
import '../login/login_page.dart';
import '../profile/profile.dart';

class AppRouter {
  static const splash = '/';
  static const login = '/login';
  static const signUp = '/sign_up';
  static const interests1 = '/interests_1';
  static const interests2 = '/interests_2';
  static const interests3 = '/interests_3';
  static const allSet = '/all_set';
  static const home = '/home';
  static const forgotPassword = '/forgot_password';
  static const chatPage = '/chat_page';
  static const profile = '/profile';
  static const matchingInProcess = '/matching_in_process';
  static const delete = '/delete';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(), settings: settings);
      case login:
        return MaterialPageRoute(
            builder: (context) => Login(), settings: settings);
      case signUp:
        return MaterialPageRoute(
            builder: (context) => SignUp(), settings: settings);
      case interests1:
        return MaterialPageRoute(
            builder: (context) => InterestsOne(), settings: settings);
      case interests2:
        return MaterialPageRoute(
            builder: (context) => InterestsTwo(), settings: settings);
      case interests3:
        return MaterialPageRoute(
            builder: (context) => InterestsThree(), settings: settings);
      case allSet:
        return MaterialPageRoute(
            builder: (context) => AllSet(), settings: settings);
      case home:
        return MaterialPageRoute(
            builder: (context) => HomeScaffold(), settings: settings);
      case forgotPassword:
        return MaterialPageRoute(
            builder: (context) => ForgotPassword(), settings: settings);
      case chatPage:
        return MaterialPageRoute(
            builder: (context) =>
                Chat(conversationInfo: settings.arguments as ConversationInfo),
            settings: settings);
      case profile:
        return MaterialPageRoute(
            builder: (context) => Profile(userId: settings.arguments as String),
            settings: settings);
      case delete:
        return MaterialPageRoute(
            builder: (context) => Delete(), settings: settings);
    }
    return null;
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text("Route ${settings.name} not found"),
        ),
      ),
    );
  }
}

extension NavigatorStateExtension on NavigatorState {
  Future<void> enterAppThroughLoginScreen() => pushNamed(AppRouter.login);

  Future<void> enterAppThroughHomeScreen() => pushNamed(AppRouter.home);

  Future<void> goToForgotPasswordScreen() =>
      pushNamed(AppRouter.forgotPassword);

  Future<void> goToSignUpScreen() => pushNamed(AppRouter.signUp);

  Future<void> goToInterests1() => pushNamed(AppRouter.interests1);

  Future<void> goToInterests2() => pushNamed(AppRouter.interests2);

  Future<void> goToInterests3() => pushNamed(AppRouter.interests3);

  Future<void> goToChatPage(ConversationInfo conversationInfo) =>
      pushNamed(AppRouter.chatPage, arguments: conversationInfo);

  Future<void> goToProfile(String? userId) =>
      pushNamed(AppRouter.profile, arguments: userId);

  Future<void> goToAllSet() => pushNamed(AppRouter.allSet);

  Future<void> goToDelete() => pushNamed(AppRouter.delete);
}

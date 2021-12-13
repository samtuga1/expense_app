import 'package:expense_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';
import 'on_boarding_model.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: const Color(0xFFf74269),
        pages: OnBoardingModel().pages,
        skipClicked: (value) {
          Navigator.pushNamed(context, HomeScreen.id);
        },
        getStartedClicked: (value) {
          Navigator.pushNamed(context, HomeScreen.id);
        },
      ),
    );
  }
}

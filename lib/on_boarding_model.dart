import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart';

class OnBoardingModel {
  final pages = [
    SkOnboardingModel(
        title: 'Save your money',
        description:
            'Easily figure out how you can save your money for the future',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/savePhoto.jpg'),
    SkOnboardingModel(
        title: 'Keep track of how you spend',
        description: 'We give you insights of how you spend your money daily',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/trackPhoto.jpg'),
    SkOnboardingModel(
        title: 'Avoid being broke',
        description: 'Learn how to set a budget to avoid bankruptcy',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/brokePhoto.jpg'),
  ];
}

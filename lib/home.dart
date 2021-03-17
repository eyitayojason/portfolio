import 'package:flutter/material.dart';
import 'package:portfolio/coolors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'footer.dart';
import 'header.dart';
import 'middle.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Coolors.primaryColor,
        child: VStack([
          if (context.isMobile) CustomAppbar().p16(),
          HeaderScreen(),
          if (context.isMobile) IntroductionWidget().p16(),
          MiddleScreen(),
          FooterScreen(),
        ]).scrollVertical(),
      ),
    );
  }
}

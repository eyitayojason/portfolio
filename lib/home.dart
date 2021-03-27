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
      child: Scaffold(
        endDrawer: DrawerWidget(),
        appBar: AppBar(
          leading: Image.asset(
            "assets/images/mylogo.png",
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Coolors.primaryColor,
        body: VStack([
          HeaderScreen(),
          if (context.isMobile) IntroductionWidget().p16(),
          MiddleScreen(),
          FooterScreen(),
        ]).scrollVertical(),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
      color: Coolors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: (Text(
              "Home",
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ), 20.heightBox,
          InkWell(
            child: (Text(
              "Projects",
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),20.heightBox,
          InkWell(
            child: (Text(
              "About",
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),20.heightBox,
          InkWell(
            child: (Text(
              "Contact",
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),
        ],
      ),
    ));
  }
}

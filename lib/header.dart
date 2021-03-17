import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'coolors.dart';

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameWidget = "Saliu\nJohnson."
        .text
        .color(Colors.white)
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make();
    return VxBox(
      child: VStack(
        [
          ZStack(
            [
              PictureWidget(),
              Row(
                children: [
                  VStack(
                    [
                      if (context.isMobile) 50.heightBox else 10.heightBox,
                      30.heightBox,
                      nameWidget,
                      20.heightBox,
                      VxBox()
                          .color(Coolors.accentColor)
                          .size(60, 10)
                          .make()
                          .shimmer(primaryColor: Coolors.accentColor),
                      30.heightBox,
                      SocialAccounts(),
                    ],
                  ).pSymmetric(h: context.percentWidth * 10, v: 32),
                  Expanded(
                    child: VxResponsive(
                      fallback: const Offstage(),
                      medium: IntroductionWidget()
                          .pOnly(left: 120)
                          .h(context.percentHeight * 60),
                      large: IntroductionWidget()
                          .pOnly(left: 120)
                          .h(context.percentHeight * 60),
                    ),
                  ),
                ],
              ).w(context.screenWidth)
            ],
          ),
        ],
      ),
    )
        .size(context.screenWidth, context.percentHeight * 60)
        .color(Coolors.seccondaryColor)
        .make();
  }
}

class IntroductionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          "- Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "@Flutter dev, Graphics designer and Digital marketer"
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        MaterialButton(
                onPressed: () {
                  launch("Github.com/eyitayojason");
                },
                child: "Visit Github Profile".text.make(),
                color: Coolors.accentColor,
                shape: Vx.roundedSm,
                hoverColor: Coolors.accentColor)
            .h(50),
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class PictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Image.asset(
          "assets/images/jason.png",
          alignment: Alignment.bottomCenter,
          colorBlendMode: BlendMode.screen,
          color: Coolors.primaryColor,
          height: context.percentHeight * 60,
          width: double.infinity,
          fit: BoxFit.cover,
        ));
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: Coolors.accentColor,
    );
  }
}

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(AntDesign.twitter, color: Colors.white).mdClick(() {
        launch("https://twitter.com/eyitayojason");
      }).make(),
      20.widthBox,
      Icon(AntDesign.instagram, color: Colors.white).mdClick(() {
        launch("https://instagram.com/eyitayojason");
      }).make(),
      20.widthBox,
      Icon(AntDesign.linkedin_square, color: Colors.white).mdClick(() {
        launch("https://twitter.com/eyitayojason");
      }).make(),
      20.widthBox,
      Icon(AntDesign.github, color: Colors.white).mdClick(() {
        launch("https://github.com/eyitayojason");
      }).make(),
      20.widthBox,
    ].hStack();
  }
}

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Coolors.primaryColor,
        leading: Image.asset(
          "assets/images/mylogo.png",
          fit: BoxFit.cover,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Drawer();
            },
            icon: Icon(
              Icons.dehaze,
            ),
            color: Colors.white,
          ),
        ]);
  }
}

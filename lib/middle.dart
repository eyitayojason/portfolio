import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'coolors.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff45A29E),
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          "All Creative Works,\n"
              .richText
              .withTextSpanChildren(
                  ["Selected projects.".textSpan.yellow400.make()])
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
            child: VxSwiper(
              items: [
                ProjectWidget(
                  assetImage: Image.asset("assets/images/shopmart.png",
                      width: double.infinity, fit: BoxFit.cover),
                  title: "Shopmart",
                ),
                ProjectWidget(
                  assetImage: Image.asset("assets/images/covidapp.png",
                      width: double.infinity, fit: BoxFit.cover),
                  title: "Covid19 App",
                ),
                ProjectWidget(
                  assetImage: Image.asset("assets/images/gtbank.png",
                      width: double.infinity, fit: BoxFit.cover),
                  title: "GTBank App",
                ),
                ProjectWidget(
                  assetImage: Image.asset("assets/images/investapp.png",
                      width: double.infinity, fit: BoxFit.cover),
                  title: "Investment App",
                ),
              ],
              height: 170,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
              enlargeCenterPage: true,
            ),
          )
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;
  final Image assetImage;

  const ProjectWidget(
      {Key key, @required this.title, @required this.assetImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      onTap: () {
        showDialog(
            barrierDismissible: true,
            useRootNavigator: true,
            useSafeArea: true,
            barrierColor: Coolors.seccondaryColor,
            barrierLabel: title,
            builder: (context) {
              return assetImage.onDoubleTap(() {
                scale();
              });
            },
            context: context);
      },
      child: Stack(
        children: [
          assetImage.box.p8.roundedSM.alignCenter
              .square(200)
              .neumorphic(
                  color: Coolors.seccondaryColor.withOpacity(0.5),
                  elevation: 1.0,
                  curve: VxCurve.concave)
              .make()
              .p16(),
          title.text.bold.white.make().objectBottomCenter(widthFactor: 2.5)
        ],
      ),
    );
  }
}

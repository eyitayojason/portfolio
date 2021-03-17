import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portfolio/header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:mailto/mailto.dart';

import 'coolors.dart';

class FooterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
          mobile: VStack(
            [
              "Got a Project?\nLet's talk."
                  .text
                  .color(Colors.white)
                  .center
                  .xl2
                  .make(),
              10.heightBox,
              InkWell(
                onTap: () {
                  launchMailto();
                },
                child: "jasonsaliu@gmail.com"
                    .text
                    .color(Coolors.accentColor)
                    .bold
                    .make()
                    .box
                    .border(color: Coolors.accentColor)
                    .p16
                    .rounded
                    .make(),
              )
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          web: HStack(
            [
              "Got a Project?\nLet's talk."
                  .text
                  .color(Colors.white)
                  .center
                  .xl2
                  .make(),
              10.widthBox,
              "jasonsaliu@gmail.com"
                  .text
                  .color(Coolors.accentColor)
                  .bold
                  .make()
                  .box
                  .border(color: Coolors.accentColor)
                  .p16
                  .rounded
                  .make()
            ],
            alignment: MainAxisAlignment.spaceAround,
          ).w(context.safePercentWidth * 70).scale50().p16(),
        ),
        50.heightBox,
       // CustomAppbar(),
        10.heightBox,
        "Thanks for scroling ".richText.semiBold.white.make()
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}

launchMailto() async {
  final mailtoLink = Mailto(
    to: ['jasonsaliu@gmail.com'],
    cc: ['jasonsaliu@outlook.com', 'eyitayojason@gmail.com'],
    subject: '',
    body: '',
  );
  await launch('$mailtoLink');
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
  String renderHtml(Mailto mailto) =>
      '''<html><head><title>mailto example</title></head><body><a href="$mailto">Open mail client</a></body></html>''';
  await for (HttpRequest request in server) {
    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.html
      ..write(renderHtml(mailtoLink));
    await request.response.close();
  }
}

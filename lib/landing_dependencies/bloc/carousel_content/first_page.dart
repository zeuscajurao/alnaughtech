import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:naughtech/global/app.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color accent = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      backgroundColor: bgColor,
      body: LayoutBuilder(
        builder: (_, constraint) {
          final double width = constraint.maxWidth;
          final double height = constraint.maxHeight;
          return SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Positioned(
                  bottom: 50,
                  top: 50,
                  left: 70,
                  right: width <= 900 ? 70 : null,
                  child: Column(
                    children: [
                      Container(
                          constraints: BoxConstraints(
                            maxWidth: width <= 900 ? width : 900,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MOBILE APP AND WEB DEVELOPMENT",
                                textAlign: width <= 900
                                    ? TextAlign.center
                                    : TextAlign.left,
                                style: TextStyle(
                                  color: accent,
                                  fontSize: 60,
                                  height: .8,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                textAlign: width <= 900
                                    ? TextAlign.center
                                    : TextAlign.left,
                                text: TextSpan(
                                  text:
                                      "Responsive Mobile design (UI) using the giant killing platform ",
                                  style: TextStyle(
                                    color: accent.withOpacity(.8),
                                    fontSize: 17,
                                    height: 1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Flutter",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: accent,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    const TextSpan(
                                      text:
                                          ".\nI can also work with Mobile-Api Integration, Firebase, In-App Purchase Integration (Playstore, Appstore), Push Notifaction, and I am also Flexible to do the things you need!",
                                    )
                                  ],
                                ),
                              )
                              // Text(
                              //   "Responsive mobile design using the giant killing platform Flutter",
                              //   textAlign: TextAlign.center,
                              // style: TextStyle(
                              //   color: accent.withOpacity(.5),
                              //   fontSize: 20,
                              //   height: .8,
                              //   fontWeight: FontWeight.w400,
                              // ),
                              // ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

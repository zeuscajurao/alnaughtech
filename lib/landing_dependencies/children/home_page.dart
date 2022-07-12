import 'dart:html';

import 'package:flutter/material.dart';
import 'package:naughtech/global/app.dart';
import 'package:naughtech/global/widget/outlined_text.dart';
import 'package:naughtech/landing_dependencies/bloc/carousel.dart';
import 'package:naughtech/landing_dependencies/landing_method.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LandingMethod {
  late final ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        scrollListener(_controller);
      });
    super.initState();
  }

  @override
  void dispose() {
    opacity.update(0.0);
    _controller.removeListener(() {
      scrollListener(_controller);
    });
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Scrollbar(
        controller: _controller,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          controller: _controller,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 650,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      // "https://i.gifer.com/to9.gif",
                      "https://www.perceptionsystem.com/wp-content/uploads/2020/12/mobile-app-development-banner.jpg",
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      color: bgColor.withOpacity(.7),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraint.maxWidth <= 900
                            ? 20
                            : constraint.maxWidth * .08,
                      ),
                      child: LayoutBuilder(
                        builder: (_, contentCnstr) {
                          final double mxw = contentCnstr.maxWidth;
                          final double mxh = contentCnstr.maxHeight;
                          return SizedBox(
                            width: mxw,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.end,
                              runAlignment: WrapAlignment.end,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: constraint.maxWidth > 900 ? 600 : mxw,
                                  height: constraint.maxWidth > 900
                                      ? (mxh * .5) - 60
                                      : mxh - 60,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 250,
                                        height: 5,
                                        color: primaryMinus,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          text: "MOBILE",
                                          style: TextStyle(
                                            color: primaryMinus,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: " / ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "WEB ",
                                            ),
                                            TextSpan(
                                              text: "DEVELOPMENT",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          height: 1,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: 350,
                                          height: 5,
                                          color: primaryMinus,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (mxw > 1115) ...{
                                  Container(
                                    width: 430,
                                    decoration: BoxDecoration(
                                      color: primaryMinus,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 30,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        "https://cloudstorysolution.com/wp-content/uploads/2020/11/209-2091411_mobileup-engagement-apps-mobile-app-development-vector-hd.png",
                                      ),
                                    ),
                                  )
                                },
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 400,
              padding: EdgeInsets.symmetric(
                horizontal:
                    constraint.maxWidth <= 900 ? 20 : constraint.maxWidth * .15,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primary,
                    primaryMinus,
                  ],
                ),
              ),
              child: LayoutBuilder(builder: (context, dim) {
                return SizedBox(
                  width: dim.maxWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: dim.maxWidth,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (dim.maxWidth > 570) ...{
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            },
                            RichText(
                              text: TextSpan(
                                  text: "Alnaugh",
                                  style: TextStyle(
                                    height: 1,
                                    fontFamily: "Alumni",
                                    color: Colors.white,
                                    fontSize: dim.maxWidth > 570 ? 150 : 120,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: "Tech",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      StrokedText(
                        text: "SOFTWARE DEVELOPMENT INDUSTRY",
                        offset: const Offset(2, 1),
                        fontSize: 45,
                        textAlign: TextAlign.center,
                        strokeColor: Colors.white.withOpacity(.5),
                        textColor: Colors.white.withOpacity(1),
                      )
                    ],
                  ),
                );
              }),
            ),
            // const MyCarousel(),
            Container(
              width: constraint.maxWidth,
              height: 1000,
              // color: Colors.blue,
            )
          ],
        ),
      );
    });
  }
}

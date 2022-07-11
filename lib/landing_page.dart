import 'package:flutter/material.dart';
import 'package:naughtech/global/app.dart';
import 'package:naughtech/landing_dependencies/bloc/appbar_choice_tab.dart';
import 'package:naughtech/landing_dependencies/bloc/carousel.dart';
import 'package:naughtech/landing_dependencies/children/home_page.dart';
import 'package:naughtech/landing_dependencies/landing_method.dart';
import 'package:naughtech/landing_dependencies/widget/appbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with LandingMethod {
  final AppbarChoiceTab _streammer = AppbarChoiceTab.instance;
  final List<Widget> _contents = [
    const HomePage(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.orange,
    ),
  ];

  @override
  void dispose() {
    _streammer.update(0);
    opacity.update(0.0);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: LayoutBuilder(builder: (context, constraint) {
        return Stack(
          children: [
            Positioned.fill(
              child: StreamBuilder<int>(
                stream: _streammer.stream,
                builder: (_, snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Container();
                  }
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: _contents[snapshot.data!],
                  );
                },
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: constraint.maxWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: constraint.maxWidth <= 900
                      ? 20
                      : constraint.maxWidth * .08,
                ),
                height: constraint.maxWidth <= 900 ? 120 : 60,
                /*
                MY APPBAR!
                */
                child: LandingHeader(
                  isMobile: constraint.maxWidth <= 900,
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

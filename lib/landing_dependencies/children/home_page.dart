import 'package:flutter/material.dart';
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
            const MyCarousel(),
            Container(
              width: constraint.maxWidth,
              height: 1000,
              color: Colors.blue,
            )
          ],
        ),
      );
    });
  }
}

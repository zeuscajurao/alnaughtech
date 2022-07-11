import 'dart:async';

import 'package:flutter/material.dart';
import 'package:naughtech/landing_dependencies/bloc/carousel_content/first_page.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({Key? key}) : super(key: key);

  @override
  State<MyCarousel> createState() => MyCarouselState();
}

class MyCarouselState extends State<MyCarousel>
    with SingleTickerProviderStateMixin {
  late final PageController _controller;
  Timer? timer;
  int currentPage = 0;
  Widget button(
          {required Function()? onPressed,
          required Widget icon,
          required bool isLeft}) =>
      SizedBox(
        width: 60,
        height: 60,
        child: MaterialButton(
          color: Colors.black.withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(
                  isLeft ? 5 : 0,
                ),
                left: Radius.circular(
                  isLeft ? 0 : 5,
                )),
          ),
          padding: const EdgeInsets.all(0),
          onPressed: onPressed,
          elevation: 0,
          child: icon,
        ),
      );
  initTimer() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
      setState(() {});
    }
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (currentPage == _pageContents.length - 1) {
        _controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
        );
      } else {
        final int page = currentPage + 1;
        _controller.animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
        );
      }
    });
  }

  @override
  void initState() {
    initTimer();
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    timer = null;
    _controller.dispose();
    super.dispose();
  }

  final List<Widget> _pageContents = [
    const FirstPage(),
    // Container(
    //   color: Colors.blue,
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    final Color base = Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: double.maxFinite,
      height: 900,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: PageView(
              onPageChanged: (index) {
                setState(() => currentPage = index);
                initTimer();
              },
              controller: _controller,
              children: _pageContents,
            ),
          ),
          Positioned(
            left: 0,
            child: button(
              onPressed: () {
                if (currentPage == 0) {
                  _controller.animateToPage(
                    _pageContents.length - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                } else {
                  final int page = currentPage - 1;
                  _controller.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                }
              },
              isLeft: true,
              icon: Icon(
                Icons.chevron_left_sharp,
                color: base,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: button(
              onPressed: () {
                if (currentPage == _pageContents.length - 1) {
                  _controller.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                } else {
                  final int page = currentPage + 1;
                  _controller.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                }
              },
              isLeft: false,
              icon: Icon(
                Icons.chevron_right_sharp,
                color: base,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

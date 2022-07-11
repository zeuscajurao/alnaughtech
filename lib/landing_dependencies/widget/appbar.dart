import 'package:flutter/material.dart';
import 'package:naughtech/global/app.dart';
import 'package:naughtech/landing_dependencies/bloc/appbar_choice_tab.dart';
import 'package:naughtech/landing_dependencies/bloc/appbar_opacity.dart';

class LandingHeader extends StatelessWidget {
  const LandingHeader({Key? key, required this.isMobile}) : super(key: key);
  static final AppBarOpacity _appBarOpacity = AppBarOpacity.instance;
  static final AppbarChoiceTab _choice = AppbarChoiceTab.instance;
  final bool isMobile;
  static final List<String> _tabContents = [
    "Home",
    "Portfolio",
    "Contact",
    "About Me"
  ];
  Widget tabBar(Color prim, Color color, {double? width}) => SizedBox(
        width: width ?? double.maxFinite,
        height: 60,
        child: StreamBuilder<int>(
          stream: _choice.stream,
          builder: (_, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return Container();
            }
            return Row(children: [
              for (int i = 0; i < _tabContents.length; i++) ...{
                Expanded(
                  child: MaterialButton(
                    height: 60,
                    onPressed: () {
                      _choice.update(i);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (snapshot.data! == i) ...{
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 60,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: prim,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                        },
                        Text(
                          _tabContents[i].toUpperCase(),
                          style: TextStyle(
                            color: snapshot.data! == i ? prim : color,
                            fontSize: 18,
                            fontWeight: snapshot.data! == i
                                ? FontWeight.w700
                                : FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              },
            ]
                // .map(
                // (e) => Expanded(
                //   child: MaterialButton(
                //     height: 60,
                //     onPressed: () {},
                //     child: Text(
                //       e,
                //       style: TextStyle(
                //         color: color,
                //         fontSize: 18,
                //         fontWeight: snapshot.data! == e
                //       ),
                //     ),
                //   ),
                // ),
                // )
                // .toList(),
                );
          },
        ),
      );
  Widget title(Color color) => RichText(
        text: TextSpan(
            text: "Alnaugh",
            style: TextStyle(
              fontFamily: "Alumni",
              color: color,
              fontSize: 30,
            ),
            children: const [
              TextSpan(
                text: "Tech",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              )
            ]),
      );
  @override
  Widget build(BuildContext context) {
    final Color accent = Theme.of(context).colorScheme.secondary;
    final Color prim = Theme.of(context).colorScheme.primary;
    return StreamBuilder<double>(
      stream: _appBarOpacity.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return Container();
        }
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: double.maxFinite,
          color: bgColor.withOpacity(snapshot.data!),
          child: isMobile
              ? Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: title(accent),
                      ),
                    ),
                    Expanded(
                      child: tabBar(
                        prim,
                        accent,
                      ),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      title(accent),
                      const Spacer(),
                      tabBar(
                        prim,
                        accent,
                        width: 600,
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}

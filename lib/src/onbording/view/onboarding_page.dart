import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';

import '../../widgets/app_scaffold.dart';
import 'widgets/widgets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static String name = '/onboarding';
  static String path = name;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _pageIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final _pages = <Widget>[
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
    const GenderOnboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 32),
          child: Column(
            children: [
              PositionIndicator(
                length: _pages.length,
                pageIndex: _pageIndex,
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) => setState(() {
                    _pageIndex = value;
                  }),
                  controller: _pageController,
                  children: _pages,
                ),
              ),
              ButtonsRow(
                length: _pages.length,
                pageIndex: _pageIndex,
                nextPage: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                previousPage: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

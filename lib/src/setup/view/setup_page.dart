import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/setup/setup.dart';
import 'package:future_of_workout/src/setup/view/view.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:go_router/go_router.dart';
import 'package:user_repository/user_repository.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  static String name = '/setup';
  static String path = name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetupBloc(
        userRepository: context.read<UserRepository>(),
      ),
      child: const SetupPageView(),
    );
  }
}

class SetupPageView extends StatefulWidget {
  const SetupPageView({super.key});

  @override
  State<SetupPageView> createState() => _SetupPageViewState();
}

class _SetupPageViewState extends State<SetupPageView> {
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

  final _pages = const <Widget>[
    GenderSetup(),
    AgeSetup(),
    HeightSetup(),
    WeightSetup(),
    FinishSetup(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<SetupBloc, SetupState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == SetupStatus.finish) {
         // context.goNamed(HomePage.name, params: WorkoutsPage.params);
        }
      },
      child: AppScaffold(
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
                  onFinish: () {
                    context.read<SetupBloc>().add(const SetupFinish());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

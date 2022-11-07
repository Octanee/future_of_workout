import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/setup/setup.dart';
import 'package:future_of_workout/src/setup/view/widgets/widgets.dart';

class FinishSetup extends StatelessWidget {
  const FinishSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupBloc, SetupState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        final user = state.user;
        return SetupContent(
          title: context.locale.finishSetup,
          description: '',
          children: [
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              children: [
                // TODO(Function): onTap go to specific page
                _DataCard(
                  text: context.locale.gender,
                  value: context.locale.genderType(user.gender.name),
                ),
                _DataCard(
                  text: context.locale.age,
                  value: user.age.toString(),
                ),
                _DataCard(
                  text: context.locale.height,
                  value: user.height.toString(),
                  suffix: user.lengthUnit.sufix,
                ),
                _DataCard(
                  text: context.locale.settingsWeight,
                  value: user.weight.toString(),
                  suffix: user.weightUnit.sufix,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _DataCard extends StatelessWidget {
  const _DataCard({
    required this.text,
    required this.value,
    this.suffix = '',
    this.onTap,
  });

  final String text;
  final String value;
  final String suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text, style: AppTextStyle.semiBold24),
          BoldText(boldText: value, mediumText: suffix),
        ],
      ),
    );
  }
}

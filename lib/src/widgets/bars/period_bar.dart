import 'package:future_of_workout/src/common.dart';

class PeriodBar extends StatelessWidget {
  const PeriodBar({
    required this.onChange,
    this.periods = const [
      Period.oneMounth,
      Period.threeMounth,
      Period.sixMounth,
      Period.year,
    ],
    this.initialIndex = 0,
    super.key,
  });

  final List<Period> periods;
  final void Function(Period period) onChange;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return ToggleBar(
      onChange: (index) {
        onChange(periods[index]);
      },
      tabs: periods
          .map<Tab>(
            (period) => Tab(
              text: context.locale.period(period.name),
            ),
          )
          .toList(),
      initialIndex: initialIndex,
    );
  }
}

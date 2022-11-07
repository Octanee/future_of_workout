import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:intl/intl.dart';

class CircuitPlaceItem extends StatelessWidget {
  const CircuitPlaceItem({
    required this.dateTime,
    required this.value,
    super.key,
  });

  final DateTime dateTime;
  final double value;

  @override
  Widget build(BuildContext context) {
    final unit = context.read<AppBloc>().state.user!.lengthUnit;
    final formatter = DateFormat('EEE, d MMM', context.languageCode);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                formatter.format(dateTime),
                style: AppTextStyle.semiBold20,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: BoldText(
                boldText:
                    UnitConverter.dispalyedLength(unit: unit, value: value)
                        .toString(),
                mediumText: unit.sufix,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

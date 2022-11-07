import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';

class CircuitItem extends StatelessWidget {
  const CircuitItem({required this.place, this.value, super.key});

  final MeasurementPlace place;
  final double? value;

  @override
  Widget build(BuildContext context) {
    final unit = context.read<AppBloc>().state.user!.lengthUnit;
    final name = context.locale.measurementPlace(place.name);
    final valueText = value?.toString();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        padding: const EdgeInsets.all(16),
        onTap: () async {
          final bloc = context.read<BodyCircuitAddBloc>();

          await showDialog<void>(
            context: context,
            builder: (context) {
              return CircuitDialog(
                value: value != null
                    ? UnitConverter.dispalyedLength(unit: unit, value: value!)
                    : null,
                title: name,
                onConfirm: (value) {
                  if (value != null) {
                    bloc.add(
                      BodyCircuitAddMeasurementPlaceChange(
                        place: place,
                        value:
                            UnitConverter.dataLength(unit: unit, value: value),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppTextStyle.semiBold20,
            ),
            if (valueText != null)
              BoldText(
                boldText: valueText,
                mediumText: unit.sufix,
              )
          ],
        ),
      ),
    );
  }
}

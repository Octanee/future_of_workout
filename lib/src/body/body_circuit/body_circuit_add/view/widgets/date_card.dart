import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/cards/cards.dart';
import 'package:intl/intl.dart';

class DateCard extends StatelessWidget {
  const DateCard({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('EEE, d MMM');

    return BlocBuilder<BodyCircuitAddBloc, BodyCircuitAddState>(
      buildWhen: (previous, current) =>
          previous.measurement?.date != current.measurement?.date,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomCard(
            padding: const EdgeInsets.all(16),
            onTap: () async {
              final bloc = context.read<BodyCircuitAddBloc>();

              final date = await showDatePicker(
                context: context,
                initialDate: state.measurement!.date,
                firstDate: DateTime.now().subtract(
                  const Duration(days: 365 * 10),
                ),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: AppColors.yellow, // <-- SEE HERE
                        onPrimary: AppColors.grey, // <-- SEE HERE
                        onSurface: AppColors.grey, // <-- SEE HERE
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              AppColors.yellow, // button text color
                        ),
                      ),
                      dialogTheme: DialogTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (date != null) {
                bloc.add(BodyCircuitAddLoading(dateTime: date));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.calendar_month_rounded),
                Text(
                  formatter.format(state.measurement!.date),
                  style: AppTextStyle.semiBold20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

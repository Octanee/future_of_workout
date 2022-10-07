import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class EquipmentList extends StatelessWidget {
  const EquipmentList({
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseDetailsBloc, ExerciseDetailsState>(
      builder: (context, state) {
        final equipments = <String>[];

        return Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (equipments.isNotEmpty)
                ..._buildSection(title: 'Equiments', equipments: equipments),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildSection({
    required String title,
    required List<String> equipments,
  }) {
    return [
      Header(text: title),
      for (var equipment in equipments) InstructionItem(text: equipment),
    ];
  }
}

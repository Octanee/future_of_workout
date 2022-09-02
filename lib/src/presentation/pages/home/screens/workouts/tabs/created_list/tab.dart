import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../logic/home/home.dart';
import '../../../../../../styles/styles.dart';
import 'widgets/widgets.dart';

class WorkoutsCreatedListTab extends StatelessWidget {
  const WorkoutsCreatedListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatedListCubit, CreatedListState>(
      builder: (context, state) {
        switch (state.status) {
          case CreatedListStatus.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),
            );
          case CreatedListStatus.success:
            return const WorkoutsCreatedListView();
          case CreatedListStatus.failure:
            return Center(
              child: Text(
                'Something went wrong!',
                style: AppTextStyle.semiBold16,
              ),
            );
        }
      },
    );
  }
}

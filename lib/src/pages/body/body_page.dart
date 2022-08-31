import 'package:flutter/material.dart';

import '../../various/colors.dart';
import '../../various/text_style.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.white,
        title: Text(
          'My Body',
          style: AppTextStyle.bold28,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.background,
    );
  }
}

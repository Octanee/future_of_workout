import 'package:flutter/material.dart';

import '../../custom/colors.dart';
import '../../custom/text_style.dart';

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
          style: AppTextStyle.textStyleBold28,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.background,
    );
  }
}

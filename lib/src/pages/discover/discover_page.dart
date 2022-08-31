import 'package:flutter/material.dart';

import '../../various/colors.dart';
import '../../various/text_style.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.white,
        title: Text(
          'Discover',
          style: AppTextStyle.bold28,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.background,
    );
  }
}

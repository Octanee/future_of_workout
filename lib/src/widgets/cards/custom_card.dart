import 'package:future_of_workout/src/common.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    this.padding = EdgeInsets.zero,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
          boxShadow: [AppShadows.shadow15],
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

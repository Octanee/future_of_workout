import 'package:future_of_workout/src/common.dart';
import 'package:lottie/lottie.dart';

class AppError extends StatelessWidget {
  const AppError({this.text, super.key});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/lottie/error.json'),
          const SizedBox(height: 16),
          Text(
            text ?? context.local.error,
            style: AppTextStyle.semiBold20,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

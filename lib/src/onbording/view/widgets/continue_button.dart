import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    required this.onPressed,
    this.isVisible = true,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          label: const Text('Continue'),
          icon: const Icon(Icons.keyboard_arrow_right_rounded),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 16,
              right: 8,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddCircuits extends StatelessWidget {
  const AddCircuits({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        // TODO(Octane): Navigate to AddBodyCircuits Page
      },
    );
  }
}

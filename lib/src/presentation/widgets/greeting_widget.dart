import 'package:flutter/material.dart';
import 'package:to_do_list/src/core/utils/get_greeting.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          getGreeting(),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const Text(
          'what\'s your plan?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}

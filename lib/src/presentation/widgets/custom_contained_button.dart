import 'package:flutter/material.dart';

class CustomContainedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool fullWidth;
  final bool isLoading;

  const CustomContainedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.fullWidth = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor),
      child: isLoading
          ? Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
    );

    if (fullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}

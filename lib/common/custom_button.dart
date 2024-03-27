import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key, required this.text, this.onPressed, this.isLoading = false});

  final String text;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Adjust the value as needed
        ),
        backgroundColor: Colors.black,
        minimumSize: const Size(150, 50),
         maximumSize: const Size(150, 50),
      ),
      child: widget.isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : Text(widget.text, style: const TextStyle(color: Colors.white)),
    );
  }
}

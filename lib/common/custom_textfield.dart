import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText, this.controller,
    this.validator
  });

  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromRGBO(130, 130, 130, 1),
          // width: 0.5,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,

            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            // helperText: 'Enter your email',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelStyle: TextStyle(fontSize: 16),
            label: Text(widget.labelText),
            labelStyle: TextStyle(fontSize: 14),
            focusedBorder: _border,
            enabledBorder: _border,
            disabledBorder: _border,
            errorBorder:_border, 
            focusedErrorBorder: _border
            // error: 
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

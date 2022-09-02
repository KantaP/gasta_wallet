import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField(
      {Key? key,
      required this.label,
      this.controller,
      this.onChanged,
      this.keyboardType,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(label),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: SizedBox(
            height: 48,
            child: TextField(
              keyboardType: keyboardType,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 1)),
                isDense: false,
              ),
              controller: controller,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
            ),
          ),
        )
      ],
    );
  }
}

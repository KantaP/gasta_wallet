import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const NumPad({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.black87),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

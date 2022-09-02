import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastawallet/src/constants/assets.dart';

class PhoneTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const PhoneTextField({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
  }) : super(key: key);

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
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 1)),
                isDense: false,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 70, maxWidth: 70),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetIcons.flagTH),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('+66' , style: Theme.of(context).textTheme.bodyText1,),
                    )
                  ],
                ),
              ),
              controller: controller,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(
                    9), //n is maximum number of characters you want in textfield
              ],
              onChanged: onChanged,
            ),
          ),
        )
      ],
    );
  }
}

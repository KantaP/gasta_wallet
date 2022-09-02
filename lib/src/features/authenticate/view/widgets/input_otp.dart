import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputOtp extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool hasNext;
  final bool hasError;
  const InputOtp(
      {Key? key,
      required this.controller,
      required this.autoFocus,
      required this.hasNext,
      required this.hasError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: (hasError) ? Colors.red : Colors.black87,
        ),
         borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextFormField(
          autofocus: autoFocus,
          controller: controller,
          keyboardType: TextInputType.number,
          cursorColor: Colors.black87,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            //   borderSide: BorderSide(
            //       color:  Colors.black87, width: 1),
            // ),
            // errorBorder: OutlineInputBorder(
            //  borderRadius: BorderRadius.circular(8),
            //   borderSide: BorderSide(
            //       color: Colors.redAccent , width: 1),
            // ),
            contentPadding: EdgeInsets.only(bottom: 3)
          ),
          textAlign: TextAlign.center,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(
                1), //n is maximum number of characters you want in textfield
          ],
          onChanged: (value) {
            if (value.length == 1 && hasNext) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          },
        ),
      ),
    );
  }
}

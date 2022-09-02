import 'package:flutter/material.dart';
import 'package:gastawallet/src/features/authenticate/view/widgets/input_otp.dart';

class OtpField extends StatelessWidget {
  final int maxLength;
  final TextEditingController controller;
  final Function(String) onSubmit;
  final String? errorState;
  OtpField({Key? key, required this.maxLength, required this.onSubmit, required this.controller, this.errorState}) : super(key: key);
  
  final List<TextEditingController> textControllers = [];

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildRowInputOtp(),
        );
  }

  List<Widget> _buildRowInputOtp() {
    List<Widget> widgets = List.generate(maxLength, (int index) {
      textControllers.add(TextEditingController());
      textControllers[index].addListener(() {
        List<String> otps = textControllers.map((e) => e.text).toList();
        onSubmit(otps.join(""));
      });
      return _widgetInputOtp(
        textControllers[index], 
        (index == 0) ? true : false,
        (index == (maxLength - 1)) ? false : true
      );
    });
    return widgets;
  }

  Widget _widgetInputOtp(TextEditingController textController , bool autoFocus, bool hasNext) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
          height: 48,
          width: 48,
          child: InputOtp(
            controller: textController,
            autoFocus: autoFocus,
            hasNext: hasNext,
            hasError: (errorState != "" && errorState != null) ? true : false,
          ),
      ),
    );
  }
}
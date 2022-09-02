import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastawallet/src/constants/assets.dart';

class InputPin extends StatelessWidget {
  
  final String pinText;
  const InputPin({Key? key, required this.pinText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: (pinText.isNotEmpty) 
        ? Image.asset(AssetIcons.circle)
        : Container()
      ),
    );
  }
}


// TextFormField(
//       readOnly: true,
//       keyboardType: TextInputType.number,
//       cursorColor: Colors.black87,
//       decoration: InputDecoration(
//         fillColor: Colors.white,
//         filled: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.black87, width: 1),
//         )
//       ),
//       textAlign: TextAlign.center,
//       inputFormatters: [
//         FilteringTextInputFormatter.digitsOnly,
//         LengthLimitingTextInputFormatter(
//             1), //n is maximum number of characters you want in textfield
//       ],
//     );
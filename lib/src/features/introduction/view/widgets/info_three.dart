import 'package:flutter/material.dart';
import 'package:gastawallet/generated/l10n.dart';
import 'package:gastawallet/src/constants/assets.dart';

class InfoThree extends StatelessWidget {


  const InfoThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        Image.asset(AssetImages.gettingStarted3),
        Text(
          S.of(context).gettingStartedInfoThreeTitle ,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            S.of(context).gettingStartedInfoThreeContent ,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
            maxLines: 4,
          ),
        ),
        // const Spacer(),
        // Padding(
        //   padding: const EdgeInsets.only(left: 16.0 , right: 16.0 , bottom: 32.0),
        //   child: ElevatedButton(
        //     onPressed: onTap, 
        //     child: Text(
        //       S.of(context).gettingStartedInfoThreeButton.toUpperCase()
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
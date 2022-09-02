import 'package:flutter/material.dart';
import 'package:gastawallet/generated/l10n.dart';
import 'package:gastawallet/src/constants/assets.dart';

class InfoTwo extends StatelessWidget {

  const InfoTwo({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        Image.asset(AssetImages.gettingStarted2),
        Text(
          S.of(context).gettingStartedInfoTwoTitle ,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            S.of(context).gettingStartedInfoTwoContent ,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
            maxLines: 4,
          ),
        ),
      ],
    );
  }
}
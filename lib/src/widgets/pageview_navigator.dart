import 'package:flutter/material.dart';
import 'package:gastawallet/src/constants/assets.dart';

class PageViewNavigator extends StatelessWidget {
  final bool active;
  const PageViewNavigator({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(active == true) {
      return Image.asset(AssetIcons.circle);
    } 
    return Image.asset(AssetIcons.circleOutline);
  }
}
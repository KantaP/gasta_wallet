import 'package:flutter/material.dart';
import 'package:gastawallet/src/features/authenticate/view/di/set_pin.vm.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetPinPage extends View<SetPinViewModel> {

  const SetPinPage({required SetPinViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SetPinPageState createState() => _SetPinPageState(viewModel);

}

class _SetPinPageState extends ViewState<SetPinPage , SetPinViewModel> {
  _SetPinPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).setPinTitle),
      ),
      body: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }

}
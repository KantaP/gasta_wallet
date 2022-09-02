import 'package:flutter/material.dart';
import 'package:gastawallet/src/features/dashboard/view/di/overview.vm.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';

class OverViewPage extends View<OverViewViewModel> {
  const OverViewPage({required OverViewViewModel viewModel , Key? key}) : super.model(viewModel, key: key);
  @override
  _OverViewPageState createState() => _OverViewPageState(viewModel);
}

class _OverViewPageState extends ViewState<OverViewPage , OverViewViewModel> {
  _OverViewPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            viewModel.signOut();
          },
          child: Text('Sign out'),
        ),
      ),
    );
  }
  
}
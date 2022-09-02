import 'package:flutter/material.dart';
import 'package:gastawallet/src/features/introduction/view/di/splash_screen.vm.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';

class SplashScreenPage extends View<SplashScreenViewModel> {
  const SplashScreenPage({required SplashScreenViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);


  @override
  _SplashScreenPageState createState() => _SplashScreenPageState(viewModel);
  
}

class _SplashScreenPageState extends ViewState<SplashScreenPage , SplashScreenViewModel> {
  _SplashScreenPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }




  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel.checkAuth();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[400],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'GASTA WALLET',
              style: Theme.of(context).textTheme.headlineLarge?.merge(const TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

}
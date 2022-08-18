import 'package:flutter/material.dart';
import 'package:gastawallet/src/di/components/injection.dart';
import 'package:gastawallet/src/features/dashboard/view/di/overview.vm.dart';
import 'package:gastawallet/src/features/dashboard/view/overview.p.dart';
import 'package:gastawallet/src/features/main/view/di/main.vm.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';

class MainPage extends View<MainViewModel> {
  const MainPage({required MainViewModel viewModel , Key? key}) : super.model(viewModel, key: key);

  @override
  _MainPageState createState() => _MainPageState(viewModel);
}

class _MainPageState extends ViewState<MainPage , MainViewModel> {
  
  _MainPageState(super.viewModel);

  final PageController _myPage = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _myPage,
        children: <Widget>[
          OverViewPage(viewModel: getIt<OverViewViewModel>())
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }

}
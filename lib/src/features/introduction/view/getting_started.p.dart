import 'package:flutter/material.dart';
import 'package:gastawallet/src/features/introduction/view/di/getting_started.vm.dart';
import 'package:gastawallet/src/features/introduction/view/widgets/info_one.dart';
import 'package:gastawallet/src/features/introduction/view/widgets/info_three.dart';
import 'package:gastawallet/src/features/introduction/view/widgets/info_two.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';

class GettingStartedPage extends View<GettingStartedViewModel> {
  const GettingStartedPage({required GettingStartedViewModel viewModel , Key? key}) : super.model(viewModel, key: key);
  
  @override
  _GettingStartedPageState createState() => _GettingStartedPageState(viewModel);
}

class _GettingStartedPageState extends ViewState<GettingStartedPage , GettingStartedViewModel> {
  _GettingStartedPageState(super.viewModel);

  final PageController _infoPage = PageController();

   @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _infoPage,
        children: <Widget>[
          InfoOne(
            onTap: () {
              _infoPage.nextPage(duration: const Duration(milliseconds: 500),curve: Curves.linear);
            },
          ),
          InfoTwo(
            onTap: () {
              _infoPage.nextPage(duration: const Duration(milliseconds: 500),curve: Curves.linear);
            }
          ),
          InfoThree(
            onTap: () {
              
            }
          )
        ],
      ),
    );
  }

}
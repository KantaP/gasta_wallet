import 'package:flutter/material.dart';
import 'package:gastawallet/generated/l10n.dart';
import 'package:gastawallet/src/features/introduction/model/getting_started.st.dart';
import 'package:gastawallet/src/features/introduction/view/di/getting_started.vm.dart';
import 'package:gastawallet/src/features/introduction/view/widgets/info_one.dart';
import 'package:gastawallet/src/features/introduction/view/widgets/info_three.dart';
import 'package:gastawallet/src/features/introduction/view/widgets/info_two.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';
import 'package:gastawallet/src/widgets/pageview_navigator.dart';

class GettingStartedPage extends View<GettingStartedViewModel> {
  const GettingStartedPage({required GettingStartedViewModel viewModel , Key? key}) : super.model(viewModel, key: key);
  
  @override
  _GettingStartedPageState createState() => _GettingStartedPageState(viewModel);
}

class _GettingStartedPageState extends ViewState<GettingStartedPage , GettingStartedViewModel> {
  
  _GettingStartedPageState(super.viewModel);

  final PageController _infoPage = PageController();
  final List<Widget> infos = [
    const InfoOne(),
    const InfoTwo(),
    const InfoThree(),
  ];

   @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: PageView(
              controller: _infoPage,
              onPageChanged: viewModel.onChangePage,
              children: infos,
            ),
          ),
          Expanded(
            flex: 0,
            child: _widgetPager(),
          ),
          const Spacer(),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0 , right: 16.0 , bottom: 32.0),
              child: _widgetButtonSubmit(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetButtonSubmit() {
    return StreamBuilder(
      stream: viewModel.state,
      builder: (context , AsyncSnapshot<GettingStartedState> value) {
        if(value.hasData) {
          if(value.data!.infoIndex < 2) {
            return OutlinedButton(
                onPressed: () {
                  _infoPage.nextPage(duration: const Duration(milliseconds: 500),curve: Curves.linear);
                }, 
                child: Text(
                  S.of(context).gettingStartedInfoNext.toUpperCase()
                ),
            );
          }
          return ElevatedButton(
            onPressed: () {
              viewModel.onTapGetStarted();
            }, 
            child: Text(
              S.of(context).gettingStartedInfoSubmit.toUpperCase()
            ),
          );
        }
        return Container();
      }
    );
  }

  Widget _widgetPager() {
    return StreamBuilder(
      stream: viewModel.state,
      builder: (context , AsyncSnapshot<GettingStartedState> value) {
        if(value.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PageViewNavigator(active: (value.data?.infoIndex == 0) ? true : false) ,
              Padding(
                padding: const EdgeInsets.only(left:8.0 ,right: 8.0),
                child:  PageViewNavigator(active: (value.data?.infoIndex == 1) ? true : false) ,
              ),
               PageViewNavigator(active: (value.data?.infoIndex == 2) ? true : false) ,
            ],
          );
        }
        return Container();
      }
    );
  }

}
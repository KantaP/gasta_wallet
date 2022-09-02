import 'package:flutter/material.dart';
import 'package:gastawallet/generated/l10n.dart';
import 'package:gastawallet/src/constants/assets.dart';
import 'package:gastawallet/src/features/authenticate/model/set_pin.st.dart';
import 'package:gastawallet/src/features/authenticate/view/di/set_pin.vm.dart';
import 'package:gastawallet/src/features/authenticate/view/widgets/input_pin.dart';
import 'package:gastawallet/src/features/authenticate/view/widgets/num_pad.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';

class SetPinPage extends View<SetPinViewModel> {
  const SetPinPage({required SetPinViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SetPinPageState createState() => _SetPinPageState(viewModel);
}

class _SetPinPageState extends ViewState<SetPinPage, SetPinViewModel> {
  _SetPinPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.listenState();
    viewModel.listenFirebaseDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).setPinTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(flex: 0, child: _widgetContent()),
          Expanded(flex: 0, child: _widgetInputPin()),
          Expanded(flex: 0, child: _widgetNumPads()),
        ],
      ),
    );
  }

  Widget _widgetContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(AssetImages.lock),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: viewModel.state,
            builder: (context, AsyncSnapshot<SetPinState> value) {
              if (value.hasData) {
                final pinAlready = value.data?.pinAlready ?? false;
                return Text(
                  (pinAlready == false)
                      ? S.of(context).setPinHeadline
                      : S.of(context).confirmPinHeadline,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 20),
                );
              }
              return const Text("");
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            child: StreamBuilder(
              stream: viewModel.state,
              builder: (context, AsyncSnapshot<SetPinState> value) {
                if (value.hasData) {
                  final pinAlready = value.data?.pinAlready ?? false;
                  return Text(
                    (pinAlready == false)
                        ? S.of(context).setPinContent
                        : S.of(context).confirmPinContent,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  );
                }
                return const Text("");
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetInputPin() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0, bottom: 76.5),
          child: StreamBuilder(
            stream: viewModel.state,
            builder: (context, AsyncSnapshot<SetPinState> value) {
              final pinAlready = value.data?.pinAlready ?? false;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: InputPin(
                      pinText: 
                      (pinAlready == false)
                      ? value.data?.getPinIndex(0) ?? ""
                      : value.data?.getConfirmPinIndex(0) ?? "",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: SizedBox(
                      height: 48,
                      width: 48,
                      child: InputPin(
                        pinText: 
                        (pinAlready == false)
                      ? value.data?.getPinIndex(1) ?? ""
                      : value.data?.getConfirmPinIndex(1) ?? "",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      height: 48,
                      width: 48,
                      child: InputPin(
                        pinText:
                        (pinAlready == false)
                      ? value.data?.getPinIndex(2) ?? ""
                      : value.data?.getConfirmPinIndex(2) ?? "",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: InputPin(
                      pinText: 
                      (pinAlready == false)
                      ? value.data?.getPinIndex(3) ?? ""
                      : value.data?.getConfirmPinIndex(3) ?? "",
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget _widgetNumPads() {
    return Container(
      child: GridView.builder(
        primary: false,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 56,
          mainAxisSpacing: 24,
        ),
        itemBuilder: (context, index) {
          if (index == 9) {
            return Container();
          }
          if (index == 11) {
            return GestureDetector(
              onTap: () => viewModel.removePin(),
              child: Image.asset(AssetIcons.backStep),
            );
          }
          if (index == 10) {
            return NumPad(
              label: "0",
              onTap: () => viewModel.setPin("0"),
            );
          }
          return NumPad(
            label: "${index + 1}",
            onTap: () => viewModel.setPin("${index + 1}"),
          );
        },
        itemCount: 12,
      ),
    );
  }
}

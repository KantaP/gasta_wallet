import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gastawallet/generated/l10n.dart';
import 'package:gastawallet/src/features/authenticate/model/phone_auth.st.dart';
import 'package:gastawallet/src/features/authenticate/view/di/phone_auth.vm.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';
import 'package:gastawallet/src/widgets/phone_text_field.dart';

class PhoneAuthPage extends View<PhoneAuthViewModel> {
  const PhoneAuthPage({required PhoneAuthViewModel viewModel , Key? key}) : super.model(viewModel, key: key);

  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState(viewModel);
  
}

class _PhoneAuthPageState extends ViewState<PhoneAuthPage, PhoneAuthViewModel> {
  _PhoneAuthPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).phoneAuthTitle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: PhoneTextField(
                    label: S.of(context).phoneAuthMobileLabel,
                    onChanged: (value) {
                      viewModel.updateState(<String, dynamic>{
                        PhoneAuthFields.mobileNumber: value
                      });
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    viewModel.verifyPhoneNumber();
                  },
                  child: Text(
                      S.of(context).phoneAuthSubmitButton.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
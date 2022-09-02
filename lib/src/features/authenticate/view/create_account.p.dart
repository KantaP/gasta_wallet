import 'package:flutter/material.dart';
import 'package:gastawallet/generated/l10n.dart';
import 'package:gastawallet/src/features/authenticate/model/create_account.st.dart';
import 'package:gastawallet/src/features/authenticate/view/di/create_account.vm.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';
import 'package:gastawallet/src/widgets/checkbox_field.dart';
import 'package:gastawallet/src/widgets/custom_text_field.dart';
import 'package:gastawallet/src/widgets/phone_text_field.dart';

class CreateAccountPage extends View<CreateAccountViewModel> {
  const CreateAccountPage({required CreateAccountViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState(viewModel);
}

class _CreateAccountPageState
    extends ViewState<CreateAccountPage, CreateAccountViewModel> {

  _CreateAccountPageState(super.viewModel);

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
          S.of(context).createAccountTitle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: PhoneTextField(
                      label: S.of(context).createAccountMobileLabel,
                      onChanged: (value) {
                        viewModel.updateState(<String, dynamic>{
                          CreateAccountFields.mobileNumber: value
                        });
                      },
                    )),
                StreamBuilder<CreateAccountState>(
                  stream: viewModel.state,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } //something went wrong. cannot get state from viewmodel
                    final state = snapshot.data!;

                    return Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: CheckBoxField(
                        value: state.acceptTerm,
                        label: S.of(context).createAccountAgreeTerm,
                        onChanged: (value) {
                          viewModel.updateState(<String, dynamic>{
                            CreateAccountFields.acceptTerm: value
                          });
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      viewModel.verifyPhoneNumber();
                    },
                    child: Text(
                        S.of(context).createAccountSubmitButton.toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

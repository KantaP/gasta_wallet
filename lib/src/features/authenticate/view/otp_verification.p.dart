import 'package:flutter/material.dart';
import 'package:gastawallet/generated/l10n.dart';
import 'package:gastawallet/src/constants/assets.dart';
import 'package:gastawallet/src/features/authenticate/model/otp_verification.st.dart';
import 'package:gastawallet/src/features/authenticate/view/di/otp_verification.vm.dart';
import 'package:gastawallet/src/features/authenticate/view/widgets/otp_field.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';

class OtpVerificationPage extends View<OtpVerificationViewModel> {
  const OtpVerificationPage(
      {required OtpVerificationViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _OtpVerificationPageState createState() =>
      _OtpVerificationPageState(viewModel);
}

class _OtpVerificationPageState
    extends ViewState<OtpVerificationPage, OtpVerificationViewModel> {
  _OtpVerificationPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  void didPush() {
    super.didPush();
    final settings = ModalRoute.of(context)?.settings;
    final arguments = settings?.arguments as Map<String, dynamic>? ?? {};
    viewModel.updateState(<String, dynamic>{
      OtpVerificationFields.phoneNumber: arguments['phoneNumber'],
      OtpVerificationFields.mode: arguments['mode'],
    });
    viewModel.verifyPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: viewModel.state,
          builder: (context, AsyncSnapshot<OtpVerificationState> snapshot) {
            return Text(
              (snapshot.data?.mode == "createAccount") 
              ? S.of(context).otpVerificationTitle
              : S.of(context).phoneAuthTitle,
            );
          }
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 0, child: _widgetContent()),
            Expanded(
              flex: 0,
              child: StreamBuilder(
                stream: viewModel.state,
                builder: (context, AsyncSnapshot<OtpVerificationState> snapshot) {
                  print('stream builder');
                  print(snapshot.data?.errorState);
                  return OtpFieldForm(
                    onSubmit: viewModel.onChangedOtp,
                    errorState: snapshot.data?.errorState,
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _widgetContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(AssetImages.dataSecurity),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
              stream: viewModel.state,
              builder: (context, AsyncSnapshot<OtpVerificationState> snapshot) {
                return Text(
                  "${S.of(context).otpVerificationHeadline} ${snapshot.data?.phoneNumber}",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 20),
                  softWrap: true,
                  textAlign: TextAlign.center,
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            child: Text(
              S.of(context).otpVerificationContent,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Text(
            "${S.of(context).otpVerificationDidNotGetCode} ${S.of(context).otpVerificationResendSMS}",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        )
      ],
    );
  }
}

class OtpFieldForm extends StatelessWidget {
  final Function(String) onSubmit;
  final String? errorState;
  const OtpFieldForm({Key? key, required this.onSubmit, this.errorState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0, bottom: 76.5),
          child: OtpField(
            maxLength: 6,
            controller: controller,
            onSubmit: onSubmit,
            errorState: errorState,
          ),
        )
      ],
    );
  }
}
